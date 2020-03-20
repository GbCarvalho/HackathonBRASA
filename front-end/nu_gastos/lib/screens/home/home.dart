import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nu_gasto/main.dart' as main;
import 'package:nu_gasto/model/transacao.dart';
import 'package:nu_gasto/screens/educacao/educacao.dart';
import 'package:nu_gasto/model/materia.dart';
import 'package:nu_gasto/screens/home/content.dart';
import 'package:nu_gasto/screens/lancamentos_manuais.dart';
import 'package:nu_gasto/screens/metas.dart';
import 'package:nu_gasto/screens/relatorios/relatorios.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'dart:convert';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _currentIndex = 0;
  PageController pageController;
  String qrcodeResult = "";
  bool showFilterButton = false;

  //* Destinos para as telas
  static Map<int, Widget> pages = {
    0: HomeContentWidget(
      movimentacoes: <Transacao>[
        Transacao(
          tipo: 0,
          nome: 'Mercado',
          descricao: 'Descrição do gasto',
          valor: 500,
          categoria: 'Despesas',
          data: DateTime.now().toString(),
        ),
        Transacao(
          tipo: 1,
          nome: 'Pagamento',
          descricao: 'Salário de abril/2019',
          valor: 15000,
          categoria: 'Rendas',
          data: DateTime.now().toString(),
        ),
      ],
    ), //'Home': //'Relatorios'
    1: RelatoriosWidget(), //'Tela de relatorios'
    2: MetasWidget(), //'Metas'
    3: EducacaoWidget(
      materias: <Materia>[
        Materia(
          title: 'Como criar bons hábitos financeiros?',
          imageURL: 'https://bit.ly/2ISTvMc',
          reward: 5,
          url: 'https://bit.ly/39VecDp',
        ),
        Materia(
          title: 'Como “limpar um nome sujo”?',
          imageURL: 'https://bit.ly/38U6gAV',
          url: 'https://bit.ly/2w3rCyx',
          reward: 11,
        ),
        Materia(
          title: 'Phishing, Vishing e Smishing: o que são esses golpes?',
          imageURL: 'https://bit.ly/3d7efxF',
          url: 'https://bit.ly/2w2GKMA',
          reward: 7,
        ),
        Materia(
          title: 'Por que é tão difícil juntar dinheiro?',
          imageURL: 'https://bit.ly/2U9fCDC',
          url: 'https://bit.ly/2UcarCH',
        ),
        Materia(
          title: 'Educação financeira: o que é e por que ela é importante?',
          imageURL: 'https://bit.ly/2TVLDAc',
          url: 'https://bit.ly/39VSjnn',
          reward: 10,
        ),
      ],
    ), //'Educação'

    4: LancamentosManuaisWidget(), //'Lançamento Manual'
  };

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildPageView(),
      bottomNavigationBar: _buildBottomBar(),
      floatingActionButton: _buildSpeedDial(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

//* Função responsável pela leitura do QR Code *//
  Future _scanQR() async {
    try {
      String qrResult = await BarcodeScanner.scan();
      setState(() {
        qrcodeResult = qrResult;
      });
    } on PlatformException catch (ex) {
      if (ex.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          qrcodeResult = "Camera permissions was denied!";
        });
      } else {
        setState(() {
          qrcodeResult = 'Unknown Error $ex';
        });
      }
    } on FormatException {
      setState(() {
        qrcodeResult = "You pressed the back button before scanning anything";
      });
    } catch (ex) {
      setState(() {
        qrcodeResult = 'Unknown Error $ex';
      });
    }
  }

  //* Função que constrói a barra superior com o botão filtrar e fechar *//
  _buildAppBar() => AppBar(
        elevation: 1,
        actions: <Widget>[
          showFilterButton
              ? IconButton(
                  icon: Icon(
                    Entypo.funnel,
                    size: 28,
                    color: main.nubankRoxoCinza,
                  ),
                  onPressed: () {},
                )
              : Container(),
          Spacer(),
          Center(
            child: Text(
              'Nu Gasto',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Spacer(),
          IconButton(
            icon: Icon(
              Icons.close,
              size: 28,
              color: main.nubankRoxoCinza,
            ),
            onPressed: () {},
          ),
        ],
      );

  //* Função que constrói um pageview com as páginas que compõe o body da aplicação. Todas as páginas estão no Map 'pages' *//
  _buildPageView() => PageView.builder(
        physics: ScrollPhysics(),
        onPageChanged: (int page) {
          setState(() {
            _currentIndex = page;
          });
        },
        itemCount: pages.length - 1,
        controller: pageController,
        reverse: false,
        itemBuilder: (context, page) {
          return FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString('assets/data/lauch.json'),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              var data = json.decode(snapshot.data.toString());
              HomeContentWidget home = HomeContentWidget();
              List<Transacao> transacoes = [];
              String accessKeyTarget =
                  '53200304059113000113650330002375129268918723';

              data['receipts'].forEach((receipt) {
                // Reservando uma transação para o qr code
                Transacao reserved;
                Transacao transacao;

                if (receipt['accessKey'].toString() == accessKeyTarget) {
                  print(
                      'ACESSKEY TARGET : ${receipt['accessKey'] == accessKeyTarget}');
                  reserved = Transacao(
                      tipo: 0,
                      nome: '${receipt['issuer']['name']}',
                      descricao: '${receipt['issuer']['tradeName']}',
                      valor: 0,
                      data:
                          '${receipt['protocol']['receiptOn'].toString().split('T')[0]}',
                      categoria: 'Categoria',
                      items: receipt['items'],
                      tipoTransacao: 'Débito');

                  if (qrcodeResult == accessKeyTarget) {
                    double itemsValoTotal = 0.0;

                    receipt['items'].forEach((subItem) {
                      // print('$subItem\n\n');
                      itemsValoTotal +=
                          double.parse('${subItem['totalAmount']}');
                    });

                    reserved.valor = itemsValoTotal;

                    transacoes.add(reserved);
                    print(
                        'O qr code foi lido, correspondeu ao alvo e foi adicionado');
                  }
                }

                // print('${reserved.nome}');

                if (receipt['accessKey'] != accessKeyTarget) {
                  transacao = Transacao(
                      tipo: 0,
                      nome: '${receipt['issuer']['name']}',
                      descricao: '${receipt['issuer']['tradeName']}',
                      valor: 0,
                      data:
                          '${receipt['protocol']['receiptOn'].toString().split('T')[0]}',
                      categoria: 'Categoria',
                      items: receipt['items'],
                      tipoTransacao: 'Débito');

                  double itemsValoTotal = 0.0;

                  receipt['items'].forEach((subItem) {
                    // print('$subItem\n\n');
                    itemsValoTotal += double.parse('${subItem['totalAmount']}');
                  });

                  transacao.valor = itemsValoTotal;

                  transacoes.add(transacao);
                }
              });

              home.setMovimentations = transacoes;

              if (page == 0) {
                pages[page] = home;
                showFilterButton = true;
              } else {
                showFilterButton = false;
              }

              print('QR CODE RESULT: ${qrcodeResult}');

              return pages[page];
            },
          );
        },
      );

  //* Função que constrói a barra de navegação inferior com os seus itens *//
  _buildBottomBar() => SafeArea(
        bottom: true,
        left: true,
        right: true,
        maintainBottomViewPadding: true,
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Theme.of(context).bottomAppBarColor,
          selectedItemColor: main.nubankCinza,
          elevation: 0,
          selectedFontSize: 15,
          unselectedFontSize: 12,
          iconSize: 5,
          showSelectedLabels: true,
          unselectedLabelStyle: TextStyle(color: main.nubankRoxoCinza),
          selectedLabelStyle: TextStyle(
            color: main.nubankCinza,
          ),
          selectedIconTheme: IconThemeData(
            color: Colors.orange,
          ),
          onTap: (page) {
            pageController.animateToPage(page,
                duration: Duration(seconds: 1), curve: Curves.easeOutQuint);
          },
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/money.svg'),
              title: Text('Transações'),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/relatorios.svg'),
              title: Text('Relatórios'),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/target.svg'),
              title: Text('Metas'),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/newspaper.svg'),
              title: Text('NuGasto +'),
            ),
          ],
        ),
      );

// * Função que constrói o Speed Dial *//
  _buildSpeedDial() => Transform.scale(
        scale: 1.2,
        child: SpeedDial(
            marginRight: MediaQuery.of(context).size.width * 0.465,
            marginBottom: MediaQuery.of(context).size.height * 0.08,
            backgroundColor: main.nubankRoxoCinza,
            overlayColor: Colors.black,
            overlayOpacity: 0.5,
            child: Icon(MaterialCommunityIcons.qrcode_scan),
            children: [
              SpeedDialChild(
                labelBackgroundColor: main.nubankRoxoEscuro,
                backgroundColor: main.nubankRoxoEscuroClaro,
                foregroundColor: main.nubankRoxoCinza,
                child: Icon(MaterialCommunityIcons.qrcode_scan),
                label: "Scanner de notas",
                labelStyle: TextStyle(fontSize: 11),
                onTap: _scanQR,
              ),
              SpeedDialChild(
                labelBackgroundColor: main.nubankRoxoEscuro,
                backgroundColor: main.nubankRoxoEscuroClaro,
                foregroundColor: main.nubankRoxoCinza,
                child: Icon(MaterialCommunityIcons.pencil_plus_outline),
                label: "Lançamento manual",
                labelStyle: TextStyle(fontSize: 11),
              )
            ]),
      );
}
