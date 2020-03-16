import 'package:flutter/material.dart';
import 'package:nu_gasto/model/transacao.dart';
import 'package:nu_gasto/main.dart' as main;

class HomeContentWidget extends StatelessWidget {
  final List<Transacao> movimentacoes;

  const HomeContentWidget({Key key, this.movimentacoes}) : super(key: key);

  getColorByTransactionType(Transacao transacao) {
    return transacao.tipo == 1 ? main.nubankVerde : main.nubankCinza;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(0),
      color: main.nubankRoxoEscuro,
      child: ListView.builder(
        itemCount: movimentacoes.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: _buildListItem(index),
          );
        },
      ),
    );
  }

  // * Responsável por contruir cada item da lista de transações
  _buildListItem(int index) => [
        ListTile(
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
