import 'package:flutter/material.dart';
import 'package:nu_gasto/main.dart' as main;
import 'package:nu_gasto/screens/educacao/materia_webviewer.dart';
import 'package:nu_gasto/model/materia.dart';
//import 'package:webview_flutter/webview_flutter.dart';

var title = 'Educação';

String get getTitle => title;

class EducacaoWidget extends StatefulWidget {
  // * Materias que aparecerão na lista
  List<Materia> materias;

  EducacaoWidget({Key key, this.materias = const []}) : super(key: key);

  @override
  _EducacaoWidgetState createState() => _EducacaoWidgetState();
}

class _EducacaoWidgetState extends State<EducacaoWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: main.nubankRoxoEscuroClaro.withOpacity(0.86),
        child: ListView(
          children: _buildCardList(),
        ));
  }

  _buildCardList() {
    var list = <Widget>[];

    print('LISTA DE MATERIAS RECEBIDA: ${widget.materias}');

    widget.materias.forEach((materia) {
      list.add(Padding(
        padding: const EdgeInsets.only(top: 20),
        child: GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MateriaWebviewer(
                destinationURL: materia.url,
              ),
            ),
          ),
          child: Column(
            children: <Widget>[
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: main.nubankRoxoPrincipal,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.45,
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Column(
                    children: <Widget>[
                      Expanded(
                          child: Stack(
                        fit: StackFit.expand,
                        children: <Widget>[
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: main.nubankRoxoPrincipal,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                            ),
                            child: Image.network(
                              materia.imageURL,
                              fit: BoxFit.cover,
                            ),
                          ),
                          _buildRewardIndicator(reward: materia.reward),
                        ],
                      )),
                      Expanded(
                          child: Container(
                        child: Center(
                          child: Text(
                            materia.title,
                            style: TextStyle(
                              fontSize: 45,
                              // fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ))
                    ],
                  ),
                ),
              ),
              Divider(
                color: Colors.transparent,
              )
            ],
          ),
        ),
      ));
    });

    return list;
  }

  _buildRewardIndicator({reward}) => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Container(
              width: 120,
              height: 30,
              child: Center(
                child: Text(
                  '${reward == null ? 0 : reward} pontos',
                  style:
                      TextStyle(color: main.nubankRoxoPrincipal, fontSize: 25),
                ),
              ),
              decoration: BoxDecoration(
                  color: main.nubankBranco,
                  borderRadius: BorderRadius.circular(6)),
            ),
          ),
        ],
      );
}
