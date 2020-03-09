import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nu_gastos/screens/home.dart';

//? Paleta de cores
Map<int, Color> color = {
  50: Color.fromRGBO(136, 14, 79, .1),
  100: Color.fromRGBO(136, 14, 79, .2),
  200: Color.fromRGBO(136, 14, 79, .3),
  300: Color.fromRGBO(136, 14, 79, .4),
  400: Color.fromRGBO(136, 14, 79, .5),
  500: Color.fromRGBO(136, 14, 79, .6),
  600: Color.fromRGBO(136, 14, 79, .7),
  700: Color.fromRGBO(136, 14, 79, .8),
  800: Color.fromRGBO(136, 14, 79, .9),
  900: Color.fromRGBO(136, 14, 79, 1),
};

// ? Tamanhos
double actionIconSize = 30.0;

var nubankRoxoPrincipal = MaterialColor(0xff8A05BE, color);
var nubankBranco = MaterialColor(0xffFFFFFF, color);
var nubankRoxoCinza = MaterialColor(0xffB3A0B6, color);
var nubankRoxoEscuroClaro = MaterialColor(0xff443147, color);
var nubankRoxoEscuro = MaterialColor(0xff3D2C3F, color);
var nubankCinza = MaterialColor(0xffC4C4C4, color);
var nubankVerde = MaterialColor(0xff9CD336, color);
var nubankVermelhoChiclete = MaterialColor(0xffE76A76, color);
var nubankLaranja = MaterialColor(0xffFF9609, color);
var nubankEscuro = MaterialColor(0xff191919, color);
var nubankAzul = MaterialColor(0xff0BBABD, color);
var prototipoCinza1 = MaterialColor(0xff818181, color);
var prototipoCinza2 = MaterialColor(0xffBDBDBD, color);
var prototipoCinza3 = MaterialColor(0xff5A5A5A, color);

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NuGasto',
      theme: ThemeData.light().copyWith(
        primaryColor: nubankRoxoPrincipal,
        bottomAppBarColor: nubankRoxoPrincipal,
        iconTheme: IconThemeData(color: nubankRoxoCinza),
      ),
      home: Home(),
    );
  }
}
