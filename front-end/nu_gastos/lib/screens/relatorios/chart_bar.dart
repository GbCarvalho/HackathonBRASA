import 'package:flutter/material.dart';
import 'dart:math';
import 'package:nu_gasto/main.dart' as main;

class ChartBarWidget extends StatelessWidget {
  final double barLimit;
  final double distanceAroundChildChartBars;
  final List<Bar> bars;
  final double innerBarsDistance;

  const ChartBarWidget({
    Key key,
    this.barLimit = 300.0,
    this.bars,
    this.distanceAroundChildChartBars = 0.03, //Tem que ser um valor entre 0 e 1
    this.innerBarsDistance = -5,
  }) : super(key: key);

  _atribuirLimites() {
    double margin;
    if (bars != null)
      for (int pos = 0; pos < bars.length; pos++) {
        bars[pos].setLimit = this.barLimit;
        for (int posMargin = pos; posMargin > 0; posMargin--) {
          if (!bars[posMargin].isFirstBar)
            margin += bars[posMargin - 1].getHeight + innerBarsDistance;
        }
        print('margin for bar $pos: $margin');
        bars[pos].setMarginLeft = margin;
        if (bars.length > 2 && pos == bars.length - 1)
          bars[pos].setMarginLeft = bars[pos].marginLeft;
        margin = 0;
      }
  }

  @override
  Widget build(BuildContext context) {
    _atribuirLimites();

    return Stack(
      textDirection: TextDirection.ltr,
      alignment: AlignmentDirectional.centerStart,
      children: <Widget>[
        SizedBox(
          height:
              MediaQuery.of(context).size.height * distanceAroundChildChartBars,
        ),
        Container(
          width:
              barLimit == null ? MediaQuery.of(context).size.width : barLimit,
          height: 1,
          color: main.nubankVerde,
        ),
        Stack(
          textDirection: TextDirection.ltr,
          alignment: AlignmentDirectional.bottomStart,
          children: bars == null
              ? <Bar>[
                  Bar(
                    height: barLimit * 0.5,
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
  double height;
  final Color barColor;
  static double limit = 1;
  double marginLeft = 0;
  final bool isFirstBar;

  set setLimit(double value) => limit = value;
  set setMarginLeft(double value) => marginLeft = value;
  set setHeight(double value) => height = value;
  get getBarHeight => this.height;
  get getIsFirstBar => this.isFirstBar;

  Bar({
    Key key,
    this.height = 150,
    this.barWidth = 10,
    this.barColor,
    this.isFirstBar = false,
  }) : super(key: key);

  get getHeight => height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: isFirstBar ? 0 : marginLeft),
      child: Container(
        width: height < MediaQuery.of(context).size.width
            ? height
            : MediaQuery.of(context)
                .size
                .width, //barLimit == null ? barFill : 150.0 / barLimit,
        height: barWidth,
        decoration: BoxDecoration(
          color: barColor == null
              ? limit <= height && limit != null
                  ? main.nubankCinza.withOpacity(0.3)
                  : main.nubankCinza
              : limit <= height && limit != null
                  ? barColor.withOpacity(0.3)
                  : barColor,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
