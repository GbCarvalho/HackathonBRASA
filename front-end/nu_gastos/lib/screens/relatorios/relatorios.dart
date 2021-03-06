import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:nu_gasto/main.dart' as main;
import 'package:nu_gasto/model/controllers/api_controller.dart';
import 'package:nu_gasto/screens/nfe_treatment.dart';
import 'package:nu_gasto/screens/relatorios/chart_bar.dart';
import 'package:nu_gasto/screens/relatorios/relatorio_mes._widget.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert';

var title = 'Relatórios';

String get getTitle => title;

class RelatoriosWidget extends StatelessWidget with ApiController {
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
                  Bar(barColor: main.nubankVermelhoChiclete, height: 100),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
