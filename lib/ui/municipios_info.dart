//import 'dart:html';

import 'dart:async';
//import 'dart:html';

import 'package:crud_flutter/model/aspectos.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:crud_flutter/model/municipio.dart';
import 'package:crud_flutter/model/aspectos.dart';
import 'package:crud_flutter/model/zona.dart';

class MunicipioInfo extends StatefulWidget {
  final Municipio municipio;
  final Aspecto aspecto;
  MunicipioInfo(this.municipio, this.aspecto);

  @override
  _MunicipioInfoState createState() => _MunicipioInfoState();
}

final municipioRefencia =
    FirebaseDatabase.instance.reference().child('municipios');
final Refencia = FirebaseDatabase.instance.reference().child('aspectos');
final zonareferencia = FirebaseDatabase.instance.reference().child('zonas');



class _MunicipioInfoState extends State<MunicipioInfo> {
  List<Municipio> items;
  List<Zona> lists;
  String _poblazao;
  StreamSubscription<Event> _onZonaAddedSubscripcion;

  @override
  void initState() {
    // TODO: implement initState

    switch (widget.aspecto.poblacion) {
      case "1":
        {
          _poblazao = "Menor a 50,000";
        }
        break;
      case "2":
        {
          _poblazao = "50,000 - 500,000";
        }
        break;
      case "3":
        {
          _poblazao = "50,000 - 1,000,000";
        }
        break;
      case "4":
        {
          _poblazao = "Mayor a 1,000,000";
        }
        break;
    }

    super.initState();
    lists = new List();
    var ref = zonareferencia.orderByChild("clave").equalTo(widget.municipio.clave);
    print(widget.municipio.clave);
    final dat = FirebaseDatabase.instance.reference().child('zonas')
        .orderByChild("clave")
        .equalTo(widget.municipio.clave);

    _onZonaAddedSubscripcion = ref.onChildAdded.listen(_onZonaAdded);
  }
 Zona zona1;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _onZonaAddedSubscripcion.cancel();
  }
  @override
  Widget build(BuildContext context) {
    print(widget.municipio.clave);
    return Scaffold(
      appBar: AppBar(
        title: Text('Municipio Informacion'),
        backgroundColor: Colors.green,
      ),
      body: Container(
        height: 700.0,
        padding: const EdgeInsets.all(20.0),
        child: Card(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  new Text("Clave : ${widget.municipio.clave}",
                    style: TextStyle(fontSize: 18.0),),
                  Padding(padding: EdgeInsets.only(top: 8.0),),
                  Divider(),
                  new Text("Nombre : ${widget.municipio.nombre}",
                    style: TextStyle(fontSize: 18.0),),
                  Padding(padding: EdgeInsets.only(top: 8.0),),
                  Divider(),
                  new Text("Significado : ${widget.municipio.significado}",
                    style: TextStyle(fontSize: 18.0),),
                  Padding(padding: EdgeInsets.only(top: 8.0),),
                  Divider(),
                  new Text("Cabecera : ${widget.municipio.cabecera}",
                    style: TextStyle(fontSize: 18.0),),
                  Padding(padding: EdgeInsets.only(top: 8.0),),
                  Divider(),
                  new Text("Superficie : ${widget.municipio.superficie}",
                    style: TextStyle(fontSize: 18.0),),
                  Padding(padding: EdgeInsets.only(top: 8.0),),
                  Divider(),
                  new Text("Altitud : ${widget.municipio.altitud}",
                    style: TextStyle(fontSize: 18.0),),
                  Padding(padding: EdgeInsets.only(top: 8.0),),
                  Divider(),
                  new Text("Clima : ${widget.municipio.clima}",
                    style: TextStyle(fontSize: 18.0),),
                  Padding(padding: EdgeInsets.only(top: 8.0),),
                  Divider(),
                  new Text("Localizacion : ${widget.municipio.localizacion}",
                    style: TextStyle(fontSize: 18.0),),
                  Padding(padding: EdgeInsets.only(top: 8.0),),
                  Divider(),
                  new Text("Elevación : ${widget.aspecto.elevado}",
                    style: TextStyle(fontSize: 18.0),),
                  Padding(padding: EdgeInsets.only(top: 8.0),),
                  Divider(),
                  new Text("Rio : ${widget.aspecto.rio}",
                    style: TextStyle(fontSize: 18.0),),
                  Padding(padding: EdgeInsets.only(top: 8.0),),
                  Divider(),
                  new Text("Cuerpo de Agua : ${widget.aspecto.cuerpoagua}",
                    style: TextStyle(fontSize: 18.0),),
                  Padding(padding: EdgeInsets.only(top: 8.0),),
                  Divider(),
                  new Text(
                    "Población : ${_poblazao}",
                    style: TextStyle(fontSize: 18.0),
                  ),
                  Padding(padding: EdgeInsets.only(top: 8.0),),
                  Divider(),
                  new Text(
                    "Industrializado? : ${widget.aspecto.industrializado}",
                    style: TextStyle(fontSize: 18.0),),
                  Padding(padding: EdgeInsets.only(top: 8.0),),
                  Divider(),
                  new Text('Zonas de riesgo', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0, color: Colors.green),),
                  Divider(),
                  new ListView.builder(itemCount: lists.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index){
                    return Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Desastre: "+lists[index].nombre, style: TextStyle(fontSize: 18.0,),),
                        ],
                      ),
                    );
                      }
                  ),
                  Divider(),
                  /*
                  FutureBuilder(
                    future: zonareferencia.orderByChild("clave").equalTo(widget.municipio.clave).once(),
                    builder: (context, AsyncSnapshot<DataSnapshot> snapshot){
                      if(snapshot.hasData){
                        //lists.clear();
                        Map<dynamic, dynamic> values = snapshot.data.value;
                        values.forEach((key, values) {
                          lists.add(values);
                        });
                        return new ListView.builder(
                            shrinkWrap: true,
                            itemCount: lists.length,
                            itemBuilder: (BuildContext context, int index){
                              return Card(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text("Desastre: "+lists[index].desastre),
                                  ],
                                ),
                              );
                            });
                      }
                      return CircularProgressIndicator();
                    },
                  )

                  new FirebaseAnimatedList(query: zonareferencia.orderByChild('clave')
                      .equalTo(widget.municipio.clave),
                      padding: new EdgeInsets.all(8.0),
                    reverse: false,
                    itemBuilder: (_, DataSnapshot snapshot,
                        Animation<double> animation, int x) {
                      return new ListTile(
                        subtitle: new Text(snapshot.value.toString()),
                      );
                    },
                  ),

                   */
                ],
              ),
            ),

          ),

        ),
      ),
    );
  }
  void _onZonaAdded(Event event){
    setState(() {
      lists.add(new Zona.fromSnapShop(event.snapshot));
      print("una prueba yaabkfenf");
      print(lists);
    });
  }
}


