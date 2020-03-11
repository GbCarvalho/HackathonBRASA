import 'package:flutter/material.dart';
import 'package:nu_gastos/main.dart' as main;
import 'package:nu_gastos/screens/relatorios/chart_bar.dart';

class RelatorioMesWidget extends StatefulWidget {
  final List<ChartBarWidget> bars;

  const RelatorioMesWidget({Key key, @required this.bars}) : super(key: key);

  @override
  RelatorioMeshWidgetState createState() => RelatorioMeshWidgetState();
}

class RelatorioMeshWidgetState extends State<RelatorioMesWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: widget.bars,
    );
  }
}
