import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nu_gasto/model/transacao.dart';
import 'package:nu_gasto/main.dart' as main;
import 'package:flutter_icons/flutter_icons.dart';

class HomeContentWidget extends StatelessWidget {
  List<Transacao> movimentacoes;

  get getFirstTransactionFromInnerList =>
      movimentacoes != null ? movimentacoes[0] : Transacao();

  set setMovimentations(List<Transacao> movs) {
    movimentacoes = movs;
  }

  HomeContentWidget({Key key, this.movimentacoes}) : super(key: key);

  getColorByTransactionType(Transacao transacao) {
    return transacao.tipo == 1 ? main.nubankVerde : main.nubankCinza;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(0),
      color: main.nubankRoxoEscuro,
      child: FutureBuilder(
        future:
            DefaultAssetBundle.of(context).loadString('assets/data/data.json'),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          var data = json.decode(snapshot.data.toString());

          return ListView.builder(
            itemCount: movimentacoes.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: _buildListItem(index, context),
              );
            },
          );
        },
      ),
    );
  }

  // * Responsável por contruir cada item da lista de transações
  _buildListItem(int index, BuildContext context) => [
        ListTile(
          onTap: () {
            var transacao = movimentacoes[index];
            showDialog(
                context: context,
                builder: (BuildContext contextInner) {
                  return AlertDialog(
                    content: Container(
                      height: 500,
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    '${transacao != null ? transacao.nome : 'LIVRARIA CULTURA'}',
                                    style: TextStyle(
                                        color: main.nubankRoxoPrincipal,
                                        fontSize: 30),
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'S/A',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: main.nubankRoxoPrincipal,
                                          fontSize: 30),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 45,
                                  )
                                ],
                              ),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: IconButton(
                                      icon: Icon(Icons.cancel),
                                      onPressed: null),
                                ),
                              ),
                            ],
                          ),
                          Divider(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Local',
                                style: TextStyle(
                                    color: main.nubankEscuro,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: <Widget>[
                                  IconButton(
                                    icon: Icon(FontAwesome.map_marker),
                                    color: main.nubankRoxoPrincipal,
                                    onPressed: () {},
                                  ),
                                  SizedBox(
                                    width: 2,
                                  ),
                                  Text(
                                    '${transacao != null ? null : 'Taguatinga'}',
                                    style: TextStyle(
                                        color: main.nubankEscuro,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 25,
                              )
                            ],
                          ),
                          Divider(),
                          Column(
                            children: <Widget>[
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: <Widget>[
                                  Text(
                                    'produtos',
                                    style: TextStyle(
                                        color: main.nubankEscuro,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Spacer(),
                                  Text(
                                    'preço',
                                    style: TextStyle(
                                        color: main.nubankEscuro,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Row(
                                children: <Widget>[
                                  Text(
                                    '1x ',
                                    style: TextStyle(
                                      color: main.nubankRoxoPrincipal,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'Livro para crianças',
                                    style: TextStyle(
                                      color: main.nubankEscuro,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                  Spacer(),
                                  Row(
                                    textBaseline: TextBaseline.alphabetic,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.baseline,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      Text(
                                        'R\$',
                                        style: TextStyle(
                                          color: main.nubankEscuro,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    '30,00',
                                    style: TextStyle(
                                      color: main.nubankEscuro,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                              Divider(),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      SizedBox(
                                        height: 25,
                                      ),
                                      Text(
                                        'Data de emissão',
                                        style: TextStyle(
                                            color: main.nubankRoxoPrincipal),
                                      ),
                                      Text(
                                        '10/03/2020',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          color: main.nubankRoxoPrincipal,
                                          fontSize: 30,
                                        ),
                                      )
                                    ],
                                  ),
                                  Spacer(),
                                  Text(
                                    '15:07',
                                    style: TextStyle(
                                      color: main.nubankRoxoPrincipal,
                                      fontSize: 30,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                          Divider(),
                          Spacer(),
                          Row(
                            children: <Widget>[
                              Text(
                                'Total',
                                style: TextStyle(
                                  color: main.nubankRoxoPrincipal,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                ),
                              ),
                              Spacer(),
                              Text(
                                'R\$ 30,00',
                                style: TextStyle(
                                  color: main.nubankRoxoPrincipal,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          )
                        ],
                      ),
                    ),
                  );
                });
          },
          leading: Column(
            children: <Widget>[
              Spacer(),
              ClipOval(
                child: Container(
                  color: main.nubankRoxoEscuro,
                  child: Icon(
                    movimentacoes[index].icon,
                    color: getColorByTransactionType(movimentacoes[index]),
                    size: 45,
                  ),
                ),
              ),
            ],
          ),
          enabled: true,
          title: Row(
            children: <Widget>[
              Text(
                '${movimentacoes[index].nome}',
                style: TextStyle(
                    color: getColorByTransactionType(movimentacoes[index]),
                    fontSize: 20),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Icon(
                  Icons.edit,
                  size: 15,
                ),
              ),
            ],
          ),
          subtitle: Text(
            '${movimentacoes[index].data.split(' ')[0]}',
            style: TextStyle(color: main.nubankCinza),
          ),
          trailing: Text(
            'R\$ ${movimentacoes[index].valor}',
            style: TextStyle(
                color: getColorByTransactionType(movimentacoes[index]),
                fontSize: 25),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Divider(
            thickness: 2,
            color: Colors.black.withOpacity(0.15),
          ),
        )
      ];
}
