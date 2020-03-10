import 'package:flutter/material.dart';

var title = 'Educação';

String get getTitle => title;

class EducacaoWidget extends StatefulWidget {
  @override
  _EducacaoWidgetState createState() => _EducacaoWidgetState();
}

class _EducacaoWidgetState extends State<EducacaoWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Educação Financeira'),
      ),
    );
  }
}
