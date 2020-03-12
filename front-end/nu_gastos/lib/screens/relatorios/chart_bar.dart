import 'package:flutter/material.dart';
import 'package:nu_gastos/main.dart' as main;

class ChartBarWidget extends StatelessWidget {
  final double barLimit;
  final double barsDistance;
  final List<Bar> bars;

  const ChartBarWidget({
    Key key,
    this.barLimit = 300.0,
    this.bars,
    this.barsDistance = 0.03, //Tem que ser um valor entre 0 e 1
  }) : super(key: key);

  _atribuirLimites() {
    if (bars != null)
      bars.forEach((bar) {
        bar.setLimit = this.barLimit;
      });
  }

  @override
  Widget build(BuildContext context) {
    _atribuirLimites();

    return Stack(
      alignment: AlignmentDirectional.centerStart,
      children: <Widget>[
        SizedBox(
          height: MediaQuery.of(context).size.height * barsDistance,
        ),
        Container(
          width:
              barLimit == null ? MediaQuery.of(context).size.width : barLimit,
          height: 1,
          color: main.nubankVerde,
        ),
        Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: bars == null
              ? <Bar>[
                  Bar(
                    barFill: barLimit * 0.5,
                  )
                ]
              : bars,
        )
      ],
    );
  }
}

class Bar extends StatelessWidget {
  final double barWidth;
  final double barFill;
  final Color barColor;
  static double limit = 1;

  const Bar({
    Key key,
    this.barWidth = 10,
    this.barFill = 150,
    this.barColor,
  }) : super(key: key);

  set setLimit(double value) => limit = value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          width: barFill, //barLimit == null ? barFill : 150.0 / barLimit,
          height: barWidth,
          decoration: BoxDecoration(
            color: barColor == null
                ? limit <= barFill && limit != null
                    ? main.nubankCinza.withOpacity(0.35)
                    : main.nubankCinza
                : limit <= barFill && limit != null
                    ? barColor.withOpacity(0.35)
                    : barColor,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ],
    );
  }
}
