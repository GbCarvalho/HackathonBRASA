import 'package:flutter/material.dart';
import 'package:nu_gastos/main.dart' as main;
import 'package:nu_gastos/screens/relatorios/chart_bar.dart';
import 'package:nu_gastos/screens/relatorios/relatorio_mes._widget.dart';

var title = 'Relatórios';

String get getTitle => title;

class RelatoriosWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: main.nubankRoxoEscuro,
      child: Column(
        children: <Widget>[
          RelatorioMesWidget(
            bars: <ChartBarWidget>[
              ChartBarWidget(
                barsDistance: 0.06,
                barLimit: 300,
                bars: <Bar>[
                  Bar(barColor: Colors.amber, barFill: 200),
                  Bar(barColor: Colors.red),
                  Bar(barColor: Colors.blue, barFill: 68),
                ],
              ),
              ChartBarWidget(),
            ],
          ),
        ],
      ),
    );
  }
}
