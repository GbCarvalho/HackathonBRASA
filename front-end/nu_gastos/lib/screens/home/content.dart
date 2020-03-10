import 'package:flutter/material.dart';
import 'package:nu_gastos/model/gasto.dart';
import 'package:nu_gastos/main.dart' as main;

class HomeContentWidget extends StatelessWidget {
  final List<Transacao> movimentacoes;

  const HomeContentWidget({Key key, this.movimentacoes}) : super(key: key);

  getColorByTransactionType(Transacao transacao) {
    return transacao.tipo == 0
        ? main.nubankVermelhoChiclete
        : transacao.tipo == 1 ? main.nubankVerde : main.nubankAzul;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: main.nubankRoxoEscuro,
      child: ListView.builder(
        itemCount: movimentacoes.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: ClipOval(
              child: Container(
                color: main.nubankRoxoEscuro,
                child: Icon(
                  Icons.home,
                  color: getColorByTransactionType(movimentacoes[index]),
                  size: 45,
                ),
              ),
            ),
            enabled: true,
            title: Text(
              '${movimentacoes[index].nome}',
              style: TextStyle(
                  color: getColorByTransactionType(movimentacoes[index]),
                  fontSize: 20),
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
          );
        },
      ),
    );
  }
}
