import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nu_gasto/main.dart' as main;
import 'package:webview_flutter/webview_flutter.dart';

class MaterialWebviewer extends StatefulWidget {
  @override
  _MaterialWebviewerState createState() => _MaterialWebviewerState();
}

class _MaterialWebviewerState extends State<MaterialWebviewer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: main.nubankRoxoEscuro,
          title: Text('Como criar bons hábitos financeiros?')),
      body: WebView(
        initialUrl:
            'https://blog.nubank.com.br/como-criar-bons-habitos-financeiros/',
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: main.nubankRoxoPrincipal,
        label: Text('Provinha :D'),
        icon: Icon(Icons.skip_next),
        onPressed: null,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

// Scaffold(
//         appBar: AppBar(
//           backgroundColor: main.nubankRoxoEscuro,
//         ),
//         body: WebView(
//           initialUrl:
//               'https://blog.nubank.com.br/como-criar-bons-habitos-financeiros/',
//         ));
//   }
