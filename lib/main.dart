import 'package:band_name/services/socket.service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:band_name/app_routes/app.routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => SocketService(),
        )
      ],
      child: MaterialApp(
        title: 'Material App',
        initialRoute: 'home',
        routes: AppRoutes,
      ),
    );
  }
}
