import 'package:flutter/material.dart';
import 'package:nu_gasto/main.dart' as main;
import 'package:nu_gasto/screens/relatorios/chart_bar.dart';
import 'package:nu_gasto/screens/relatorios/relatorio_mes._widget.dart';

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
                distanceAroundChildChartBars: 0.01,
                innerBarsDistance: -10,
                barLimit: 400,
                bars: <Bar>[
                  Bar(barColor: main.nubankAzul, height: 100, isFirstBar: true),
                  //Bar(barColor: main.nubankVermelhoChiclete, height: 100),
                  //Bar(barColor: main.nubankVerde, height: 100),
                  //Bar(barColor: main.nubankRoxoCinza, height: 100),
                  //Bar(barColor: main.nubankBranco, height: 50),
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
