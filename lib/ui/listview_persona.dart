import 'dart:html';

import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'dart:async';
import 'package:crud_flutter/ui/persona_screen.dart';
import 'package:crud_flutter/ui/personas_info.dart';
import 'package:crud_flutter/model/persona.dart';

class ListViewPersonas extends StatefulWidget{
  @override
  _ListViewPersonasState createState() => _ListViewPersonasState();
}

final personasReference = FirebaseDatabase.instance.reference().child('personas');

class _ListViewPersonasState extends State<ListViewPersonas>{
  List<Persona> items;
  StreamSubscription<Event> _onPersonaAddedSubscripcion;
  StreamSubscription<Event> _onPersonaCambioSubscripcion;


  @override
  void initState() {
    super.initState();
    items = new List();
    _onPersonaAddedSubscripcion =
        personasReference.onChildAdded.listen(_onPersonaAdded);
    _onPersonaCambioSubscripcion =
        personasReference.onChildChanged.listen(_onPersonaCambio);
  }


  @override
  void dispose() {
    super.dispose();
    _onPersonaAddedSubscripcion.cancel();
    _onPersonaAddedSubscripcion.cancel();
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
                          onTap: () => _navegarAlaInformacionPersonal(context, items[position]))),
                      IconButton(
                          icon: Icon(Icons.delete, color: Colors.redAccent),
                          onPressed: () => _eliminarPersona(context, items[position],position)),
                      IconButton(
                          icon: Icon(Icons.edit, color: Colors.greenAccent),
                          onPressed: () => _navegarAlProducto(context, items[position]))
                    ],
                    ),
                  ],
                );
              }
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add, color: Colors.white),
          backgroundColor: Colors.deepPurpleAccent,
          onPressed: () => _createNewPersona(context),
        ),
      ),
    );
  }
  void _onPersonaAdded(Event event){
    setState(() {
      items.add(new Persona.fromSnapShop(event.snapshot));
    });
  }

  void _onPersonaCambio(Event event){
    var oldPersonaValor=items.singleWhere((persona) => persona.id == event.snapshot.key);
    setState(() {
      items[items.indexOf(oldPersonaValor)] = new Persona.fromSnapShop(event.snapshot);
    });
  }

  void _eliminarPersona(BuildContext context, Persona persona, int position)async {
    await personasReference.child(persona.id).remove().then((_) {
      setState(() {
        items.removeAt(position);
        Navigator.of(context).pop();
      });
    });
  }

  void _navegarAlaInformacionPersonal(BuildContext context, Persona persona) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PersonaScreen(persona)),
    );
  }

  void _navegarAlProducto(BuildContext context, Persona persona) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PersonaInformacion(persona)),
    );
  }

  void _createNewPersona(BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              PersonaScreen(Persona(null, '', '', '', '', '', ''))),
    );
  }
}