import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ApiController {
  getJsonNfeDataFromAssets({
    @required BuildContext context,
    @required Widget destination,
  }) {
    openScreenDestination(context, destination);
  }

  openScreenDestination(BuildContext context, Widget destination) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (BuildContext context) {
        return destination;
      }),
    );
  }

  /// Assumes the given path is a text-file-asset.
  Future<dynamic> getFileData(BuildContext context, String path) async {
    var result = await DefaultAssetBundle.of(context).loadString(path);

    return result;
  }
}
