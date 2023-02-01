import 'package:flutter/material.dart';

import 'package:band_name/screens/screens.dart';

var AppRoutes = <String, WidgetBuilder>{
  'home': (_) => HomeScreen(),
  'status':(_) => StatusScreen()
};
