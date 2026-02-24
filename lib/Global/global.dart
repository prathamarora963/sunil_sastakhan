import 'package:flutter/material.dart';

class Global {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  static GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
}
