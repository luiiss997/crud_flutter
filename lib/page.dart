import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'dart:async';
import 'package:crud_flutter/ui/municipios_info.dart';
import 'package:crud_flutter/model/municipio.dart';

//ne memes flutter 7n7

class ListViewMunicipios2 extends StatefulWidget{
  @override
  _ListViewMunicipiosState createState() => _ListViewMunicipiosState();
}

final municipiosReference = FirebaseDatabase.instance.reference().child('municipios');

class _ListViewMunicipiosState extends State<ListViewMunicipios2>{
  List<Municipio> items;
  StreamSubscription<Event> _onMunicipioAddedSubscripcion;
  StreamSubscription<Event> _onMunicipioCambioSubscripcion;

  @override
  void initState() {
    super.initState();
    items = new List();
    _onMunicipioAddedSubscripcion =
        municipiosReference.onChildAdded.listen(_onMunicipioAdded);
    _onMunicipioCambioSubscripcion =
        municipiosReference.onChildChanged.listen(_onMunicipioCambio);
  }


  @override
  void dispose() {
    super.dispose();
    _onMunicipioAddedSubscripcion.cancel();
    _onMunicipioCambioSubscripcion.cancel();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Municipios',
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
                          subtitle: Text('${items[position].clave}',
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
                                child: Text('${items[position].significado}',
                                  style: TextStyle(
                                      color: Colors.blueAccent,
                                      fontSize: 21.0
                                  ),
                                ),
                              )
                            ],
                          ),
                          onTap: () => _navegarAlProducto(context, items[position]),
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

  void _onMunicipioAdded(Event event){
    setState(() {
      items.add(new Municipio.fromSnapShop(event.snapshot));
    });
  }

  void _onMunicipioCambio(Event event){
    var oldMunicipioValor=items.singleWhere((municipio) => municipio.id == event.snapshot.key);
    setState(() {
      items[items.indexOf(oldMunicipioValor)] = new Municipio.fromSnapShop(event.snapshot);
    });
  }

  void _navegarAlProducto(BuildContext context, Municipio municipio) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MunicipioInfo(municipio)),
    );
  }

}