import 'package:flutter/material.dart';

var title = 'Relatórios';

String get getTitle => title;

class RelatoriosWidget extends StatefulWidget {
  @override
  _RelatoriosWidgetState createState() => _RelatoriosWidgetState();
}

class _RelatoriosWidgetState extends State<RelatoriosWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      height: 500,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[],
        ),
      ),
    );
  }
}
