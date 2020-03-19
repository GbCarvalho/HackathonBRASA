import 'package:flutter/material.dart';
import 'dart:convert';

class TestNfeDataTreatmentWidget extends StatefulWidget {
  final String data;

  const TestNfeDataTreatmentWidget({Key key, this.data}) : super(key: key);

  @override
  _TestNfeDataTreatmentWidgetState createState() =>
      _TestNfeDataTreatmentWidgetState();
}

class _TestNfeDataTreatmentWidgetState
    extends State<TestNfeDataTreatmentWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: FutureBuilder(
        future: DefaultAssetBundle.of(context).loadString(widget.data),
        builder: (BuildContext context, snapshot) {
          var myData = json.decode(snapshot.data.toString());
          return Center(
            child: SingleChildScrollView(
              child: Text(
                '${myData == null ? 'Os dados aparecerão aqui' : (myData['items'].length)}',
                style: TextStyle(color: Colors.white, fontSize: 50),
              ),
            ),
          );
        },
      ),
    );
  }
}
