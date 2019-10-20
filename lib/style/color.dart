import 'package:flutter/material.dart';

Map<int, Color> customGreen = {
  50: Color.fromRGBO(24, 184, 106, .1),
  100: Color.fromRGBO(24, 184, 106, .2),
  200: Color.fromRGBO(24, 184, 106, .3),
  300: Color.fromRGBO(24, 184, 106, .4),
  400: Color.fromRGBO(24, 184, 106, .5),
  500: Color.fromRGBO(24, 184, 106, .6),
  600: Color.fromRGBO(24, 184, 106, .7),
  700: Color.fromRGBO(24, 184, 106, .8),
  800: Color.fromRGBO(24, 184, 106, .9),
  900: Color.fromRGBO(24, 184, 106, 1),
};
MaterialColor colorCustomGreen = MaterialColor(0xFF18B86A, customGreen);

TextStyle vehicleTitleUnSelected =
    TextStyle(color: Colors.grey[600], fontSize: 20);
TextStyle vehicleDescUnSelected =
    TextStyle(color: Colors.grey[600], fontSize: 16);
TextStyle vehicleTitleSelected =
    TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold);
TextStyle vehicleDescSelected =
    TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold);
Color vehicleSelectedColor = colorCustomGreen;
Color vehicleUnSelectedColor = Colors.grey[200];
