import 'package:flutter/material.dart';
import 'package:nu_gastos/main.dart' as main;

class ChartBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: <Widget>[
        Container(
          width: 2,
          height: MediaQuery.of(context).size.width,
          color: main.nubankVerde,
        ),
        Container(
          width: 10,
          height: 250,
          decoration: BoxDecoration(
            color: main.nubankCinza,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ],
    );
  }
}
