import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:nu_gasto/main.dart' as main;
import 'package:webview_flutter/webview_flutter.dart';

class MateriaWebviewer extends StatefulWidget {
  String destinationURL;
  String title;

  MateriaWebviewer({
    Key key,
    this.destinationURL,
    this.title = '',
  }) : super(key: key);

  @override
  _MateriaWebviewerState createState() => _MateriaWebviewerState();
}

class _MateriaWebviewerState extends State<MateriaWebviewer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: main.nubankRoxoEscuro, title: Text(widget.title)),
      body: WebView(
        initialUrl: widget.destinationURL,
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: main.nubankRoxoPrincipal,
        label: Text('Recapitular'),
        icon: Icon(MaterialIcons.navigate_next),
        onPressed: null,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
