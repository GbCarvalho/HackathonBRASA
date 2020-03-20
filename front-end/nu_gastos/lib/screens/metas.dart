import 'package:flutter/material.dart';
import 'package:nu_gasto/main.dart' as main;

var title = 'Metas';

String get getTitle => title;

class MetasWidget extends StatefulWidget {
  @override
  _MetasWidgetState createState() => _MetasWidgetState();
}

class _MetasWidgetState extends State<MetasWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: main.nubankRoxoEscuro,
    );
  }
}
