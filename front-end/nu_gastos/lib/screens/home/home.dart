import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter/material.dart';
import 'package:nu_gastos/main.dart' as main;
import 'package:nu_gastos/model/transacao.dart';
import 'package:nu_gastos/screens/educacao.dart';
import 'package:nu_gastos/screens/home/content.dart';
import 'package:nu_gastos/screens/lancamentos_manuais.dart';
import 'package:nu_gastos/screens/metas.dart';
import 'package:nu_gastos/screens/relatorios/relatorios.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

Widget _buildMovimentationsList() {
  return ListTile();
}

class _HomeState extends State<Home> {
  var _currentIndex = 0;
  PageController pageController;

  // Destinos para as telas
  Map<int, Widget> pages = {
    0: RelatoriosWidget(), //'Relatorios'
    1: HomeContentWidget(
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
        Transacao(
          tipo: 2,
          nome: 'Notebook',
          descricao: 'Compra do novo laptop',
          valor: 25000,
          categoria: 'Compras',
          data: DateTime.now().toString(),
        ),
      ],
    ), //'Home':
    2: LancamentosManuaisWidget(), //'Lançamento Manual'
    3: EducacaoWidget(), //'Educação'
    4: MetasWidget(), //'Metas'
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
      appBar: AppBar(
        elevation: 1,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Entypo.funnel,
              size: 28,
              color: main.nubankRoxoCinza,
            ),
            onPressed: () {},
          ),
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
      ),
      body: PageView.builder(
        itemCount: pages.length,
        controller: pageController,
        reverse: false,
        itemBuilder: (context, page) {
          return pages[page];
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Theme.of(context).bottomAppBarColor,
          selectedIconTheme: IconThemeData(
            color: Colors.white,
            size: 42,
          ),
          onTap: (page) {
            pageController.animateToPage(page,
                duration: Duration(seconds: 1), curve: Curves.easeOutQuint);

            setState(() {
              _currentIndex = page;
            });
          },
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                MaterialCommunityIcons.script_text_outline,
                color: Theme.of(context).iconTheme.color,
              ),
              title: Text(
                'Relatórios',
                style: TextStyle(color: Colors.white),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                MaterialCommunityIcons.pencil_plus_outline,
                color: Theme.of(context).iconTheme.color,
              ),
              title: Text(
                'Home',
                style: TextStyle(color: Colors.white),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.local_library,
                color: Theme.of(context).iconTheme.color,
              ),
              title: Text(
                'Lançamento manual',
                style: TextStyle(color: Colors.white),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.merge_type,
                color: Theme.of(context).iconTheme.color,
              ),
              title: Text(
                'Educação',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ]),
      floatingActionButton: Transform.scale(
        scale: 1.2,
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: main.nubankRoxoCinza,
          splashColor: main.nubankRoxoPrincipal,
          child: Center(child: Icon(MaterialCommunityIcons.qrcode_scan)),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
