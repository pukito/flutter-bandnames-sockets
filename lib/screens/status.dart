import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:band_name/services/socket.service.dart';

class StatusScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final socketService = Provider.of<SocketService>(context);
    //socketService.socket.emit()
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[Text('ServerStatus: ${socketService.serverStatus}')],
      )),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.message),
          onPressed: () {
            //TODO: emitir emit-mensaje {'nombre': 'Flutter', 'mensaje': 'Hola desde flutter'}
            socketService.socket.emit('emitir-mensaje',
                {'nombre': 'Flutter', 'mensaje': 'Hola desde flutter'});
          }),
    );
  }
}
