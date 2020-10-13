import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:crud_flutter/model/municipio.dart';


class MunicipioInfo extends StatefulWidget {
  final Municipio municipio;
  MunicipioInfo(this.municipio);
  @override
  _MunicipioInfoState createState() => _MunicipioInfoState();
}

final municipioRefencia = FirebaseDatabase.instance.reference().child('municipios');

class _MunicipioInfoState extends State<MunicipioInfo> {

  List<Municipio> items;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.municipio.num);
    return Scaffold(
      appBar: AppBar(
        title: Text('Municipio Informacion'),
        backgroundColor: Colors.green,
      ),
      body: Container(
        height: 400.0,
        padding: const EdgeInsets.all(20.0),
        child: Card(
          child: Center(
            child: Column(
              children: <Widget>[
                new Text("Clave : ${widget.municipio.clave}", style: TextStyle(fontSize: 18.0),),
                Padding(padding: EdgeInsets.only(top: 8.0),),
                Divider(),
                new Text("Nombre : ${widget.municipio.nombre}", style: TextStyle(fontSize: 18.0),),
                Padding(padding: EdgeInsets.only(top: 8.0),),
                Divider(),
                new Text("Significado : ${widget.municipio.significado}", style: TextStyle(fontSize: 18.0),),
                Padding(padding: EdgeInsets.only(top: 8.0),),
                Divider(),
                new Text("Cabecera : ${widget.municipio.cabecera}", style: TextStyle(fontSize: 18.0),),
                Padding(padding: EdgeInsets.only(top: 8.0),),
                Divider(),
                new Text("Superficie : ${widget.municipio.superficie}", style: TextStyle(fontSize: 18.0),),
                Padding(padding: EdgeInsets.only(top: 8.0),),
                Divider(),
                new Text("Altitud : ${widget.municipio.altitud}", style: TextStyle(fontSize: 18.0),),
                Padding(padding: EdgeInsets.only(top: 8.0),),
                Divider(),
                new Text("Clima : ${widget.municipio.clima}", style: TextStyle(fontSize: 18.0),),
                Padding(padding: EdgeInsets.only(top: 8.0),),
                Divider(),
                new Text("Localizacion : ${widget.municipio.localizacion}", style: TextStyle(fontSize: 18.0),),
                Padding(padding: EdgeInsets.only(top: 8.0),),
                Divider(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

