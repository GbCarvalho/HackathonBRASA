import 'package:flutter/material.dart';
import 'package:nu_gastos/main.dart' as main;
import 'package:nu_gastos/screens/relatorios/chart_bar.dart';

class RelatorioMesWidget extends StatefulWidget {
  final List<ChartBarWidget> bars;
  final double barWidth;

  _atribuirWidth(List<ChartBarWidget> bars) {
    bars.forEach((bar) {
      bar.bars.forEach((innerBar) {
        // innerBar.barWidth = this.barWidth;
      });
    });
  }

  const RelatorioMesWidget({Key key, @required this.bars, this.barWidth = 10})
      : super(key: key);

  @override
  RelatorioMeshWidgetState createState() => RelatorioMeshWidgetState();
}

class RelatorioMeshWidgetState extends State<RelatorioMesWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: widget.bars,
    );
  }
}
