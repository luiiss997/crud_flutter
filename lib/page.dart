import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'dart:async';
import 'package:crud_flutter/model/persona.dart';

class ListViewPersonas2 extends StatefulWidget{
  @override
  _ListViewPersonasState createState() => _ListViewPersonasState();
}

final personasReference = FirebaseDatabase.instance.reference().child('personas');

class _ListViewPersonasState extends State<ListViewPersonas2>{
  List<Persona> items;
  StreamSubscription<Event> _onPersonaAddedSubscripcion;
  StreamSubscription<Event> _onPersonaCambioSubscripcion;

  @override
  void initState() {
    super.initState();
    items = new List();
  }

  @override
  void dispose() {
    super.dispose();
    _onPersonaAddedSubscripcion.cancel();
    _onPersonaCambioSubscripcion.cancel();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Personas',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Información'),
          centerTitle: true,
          backgroundColor: Colors.lightBlue,
        ),
        body: Center(
          child: ListView.builder(itemCount: items.length,
              padding: EdgeInsets.only(top: 12.0),
              itemBuilder: (context, position){
                return Column(
                  children: <Widget>[
                    Divider(height: 7.0,),
                    Row(children: <Widget>[
                      Expanded(child: ListTile(title: Text('${items[position].nombre}',
                        style: TextStyle(color: Colors.blueAccent, fontSize: 21.0),
                      ),
                          subtitle: Text('${items[position].ap_pat}',
                            style: TextStyle(
                                color: Colors.blueAccent,
                                fontSize: 21.0
                            ),
                          ),
                          leading: Column(
                            children: <Widget>[
                              CircleAvatar(
                                backgroundColor: Colors.amberAccent,
                                radius: 17.0,
                                child: Text('${items[position].ap_mat}',
                                  style: TextStyle(
                                      color: Colors.blueAccent,
                                      fontSize: 21.0
                                  ),
                                ),
                              )
                            ],
                          ),
                      )),
                    ],
                    ),
                  ],
                );
              }
          ),
        ),
      ),
    );
  }

}