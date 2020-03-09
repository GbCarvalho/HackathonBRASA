import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RelatoriosWidget extends StatefulWidget {
  @override
  _RelatoriosWidgetState createState() => _RelatoriosWidgetState();
}

class _RelatoriosWidgetState extends State<RelatoriosWidget> {
  var content = 'Response Content: Sem dados';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      height: 500,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text('$content'),
            RaisedButton(
              onPressed: () async {
                var data = await getData();
                print('Pressed');
                setState(() {
                  content = data['data'];
                });
              },
              child: Text(
                'Test',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}

today() async {
  //* Buscando e armazenando os dados da api na variavel data
  var data = await getData();

  //* Exibindo os dados da api
  print('\n\n###################### HG Brasil ######################');
  print('${data['date']} -> ${data['data']}');
}

Future getData() async {
  // Link da api que será acessada
  String url = 'https://api.hgbrasil.com/finance?key=28a5a045';

  // Solicitando uma resposta
  http.Response response = await http.get(url);

  // Verificando se a reposta foi recebida com sucesso
  if (response.statusCode == 200) {
//    Pegando  todos os dados no objeto currencies em results
    var data = json.decode(response.body)['results']['currencies'];

//  Pegando separadamente os dados de cada moeda:
    var usd = data['USD'];
    var eur = data['EUR'];
    var gbp = data['GBP'];
    var ars = data['ARS'];
    var btc = data['BTC'];

//  Colocando os dados das moedas em um Map
    Map formatedMap = Map();
    formatedMap['date'] = now();
    formatedMap['data'] = '${usd['name']} : ${usd['buy']} | '
        '${eur['name']} : ${eur['buy']} | '
        '${gbp['name']} : ${gbp['buy']} | '
        '${ars['name']} : ${ars['buy']} | '
        '${btc['name']} : ${btc['buy']} | ';

    return formatedMap;
  } else {
    throw ('Falha!');
  }
}

// Retorna a data atual formatada
now() {
  var now = DateTime.now();
  return '${now.day.toString().padLeft(2, '0')}/${now.month.toString().toString().padLeft(2, '0')}/${now.year.toString().padLeft(2, '0')}';
}
