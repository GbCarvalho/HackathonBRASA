import 'package:flutter/material.dart';
import 'package:nu_gasto/main.dart' as main;
import 'package:nu_gasto/screens/educacao/materia_webviewer.dart';
//import 'package:webview_flutter/webview_flutter.dart';

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
        color: main.nubankRoxoEscuroClaro.withOpacity(0.86),
        child: ListView(
          children: <Widget>[
            Container(
              color: main.nubankRoxoEscuro,
              child: Column(
                children: <Widget>[
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MateriaWebviewer()));
                    },
                    leading: Image.network(
                        'https://i2.wp.com/blog.nubank.com.br/wp-content/uploads/2020/01/ha%CC%81bitos-financeiros-para-guardar-dinheiro_header.jpg?w=1440&ssl=1'),
                    title: Text(
                      'Como criar bons hábitos financeiros?',
                      style: TextStyle(decoration: TextDecoration.underline),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Divider(
                        thickness: 2,
                        color: Colors.black.withOpacity(0.15),
                      ))
                ],
              ),
            ),
          ],
        ));
  }
}
