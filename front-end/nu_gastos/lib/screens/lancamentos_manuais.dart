import 'package:flutter/material.dart';

var title = 'Lançamento manual';

String get getTitle => title;

class LancamentosManuaisWidget extends StatefulWidget {
  @override
  _LancamentosManuaisWidgetState createState() =>
      _LancamentosManuaisWidgetState();
}

class _LancamentosManuaisWidgetState extends State<LancamentosManuaisWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Lançamentos Manuais'),
      ),
    );
  }
}
