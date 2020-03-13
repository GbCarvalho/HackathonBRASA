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
      for (int pos = 1; pos < bars.length; pos++) {
        bars[pos].setLimit = this.barLimit;
        for (int i = pos; i > 1; i--) {
          bars[pos].setMarginLeft = bars[pos - 1].getBarHeight - 7;
        }
      }
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
  final double height;
  final Color barColor;
  static double limit = 1;
  static double marginLeft = 0;
  final bool isFirstBar;

  set setLimit(double value) => limit = value;
  set setMarginLeft(double value) => marginLeft = value;
  get getBarHeight => this.height;
  get getIsFirstBar => this.isFirstBar;

  const Bar({
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
                  ? main.nubankCinza.withOpacity(0.35)
                  : main.nubankCinza
              : limit <= height && limit != null
                  ? barColor.withOpacity(0.35)
                  : barColor,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
