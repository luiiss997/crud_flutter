import 'dart:async';
import 'package:crud_flutter/model/aspectos.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:crud_flutter/model/municipio.dart';
import 'package:crud_flutter/model/zona.dart';

class MunicipioInfoC extends StatefulWidget {
  final Municipio municipio;
  final Aspecto aspecto;
  MunicipioInfoC(this.municipio, this.aspecto);
  @override
  _MunicipioInfoCState createState() => _MunicipioInfoCState();
}
final municipioRefencia =
FirebaseDatabase.instance.reference().child('municipios');
final Refencia = FirebaseDatabase.instance.reference().child('aspectos');
final zonareferencia = FirebaseDatabase.instance.reference().child('zonas');

class _MunicipioInfoCState extends State<MunicipioInfoC> {
  List<Municipio> items;
  List<Zona> lists;
  String _poblazao;
  StreamSubscription<Event> _onZonaAddedSubscripcion;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
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
    var ref = zonareferencia.orderByChild("clave").equalTo(
        widget.municipio.clave);
    print(widget.municipio.clave);

    _onZonaAddedSubscripcion = ref.onChildAdded.listen(_onZonaAdded);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _onZonaAddedSubscripcion.cancel();
  }
  @override
  Widget build(BuildContext context) {
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
                    "Industrializado : ${widget.aspecto.industrializado}",
                    style: TextStyle(fontSize: 18.0),),
                  Padding(padding: EdgeInsets.only(top: 8.0),),
                  Divider(),
                  new Text('Zonas de riesgo', style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: Colors.green),),
                  Divider(),
                  new ListView.builder(itemCount: lists.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text( lists[index].nombre,
                                style: TextStyle(fontSize: 18.0,),),

                            ],
                          ),
                        );
                      }
                  ),
                  Divider(),

                ],
              ),
            ),

          ),

        ),
      ),
    );
  }
  void _onZonaAdded(Event event) {
    setState(() {
      lists.add(new Zona.fromSnapShop(event.snapshot));
      print("una prueba yaabkfenf");
      print(lists);
    });
  }
}
