import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:band_name/models/band.model.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<BandModel> bands = [
    BandModel(id: '1', name: 'Metallica', votes: 5),
    BandModel(id: '2', name: 'The Beatles', votes: 3),
    BandModel(id: '3', name: 'Iron Maiden', votes: 4),
    BandModel(id: '4', name: 'Pink Floyd', votes: 2),
    BandModel(id: '5', name: 'Bon Jovi', votes: 1),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'BandNames',
            style: TextStyle(color: Colors.black87),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: ListView.builder(
          itemCount: bands.length,
          itemBuilder: (BuildContext context, i) => _bandTile(bands[i])),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        elevation: 1,
        //envio solo la referencia
        onPressed: addNewBand,
      ),
    );
  }

  Widget _bandTile(BandModel band) {
    return Dismissible(
      key: Key(band.id!),
      direction: DismissDirection.startToEnd,
      onDismissed: (direction) {
        print('direction: $direction');
        print('id: ${band.id!}');
        print('prueba');
        //TODO realizar el llamado en el servidor
      },
      background: Container(
          color: Colors.red,
          padding: const EdgeInsets.only(left: 8.0),
          child: const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Delete Band',
                style: TextStyle(color: Colors.white),
              ))),
      child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.blue[100],
            child: Text(band.name!.substring(0, 2)),
          ),
          title: Text(band.name!),
          trailing: Text(
            '${band.votes}',
            style: const TextStyle(fontSize: 20),
          ),
          onTap: () {
            print(band.name);
          }),
    );
  }

  addNewBand() {
    final textController = TextEditingController();
    if (Platform.isAndroid) {
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('New band name:'),
              content: TextField(
                controller: textController,
              ),
              actions: <Widget>[
                MaterialButton(
                    elevation: 5,
                    textColor: Colors.blue,
                    onPressed: () => addBandToList(textController.text),
                    child: const Text('Add'))
              ],
            );
          });
    }
    showCupertinoDialog(
        context: context,
        builder: (_) {
          return CupertinoAlertDialog(
            title: const Text('New band name:'),
            content: CupertinoTextField(
              controller: textController,
            ),
            actions: <Widget>[
              CupertinoDialogAction(
                isDefaultAction: true,
                child: const Text('Add'),
                onPressed: () => addBandToList(textController.text),
              ),
              CupertinoDialogAction(
                isDestructiveAction: true,
                child: const Text('Dismiss'),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          );
        });
  }

  void addBandToList(String name) {
    print(name);
    if (name.length > 1) {
      bands.add(BandModel(id: DateTime.now().toString(), name: name, votes: 0));
      setState(() {});
    }

    Navigator.pop(context);
  }
}
