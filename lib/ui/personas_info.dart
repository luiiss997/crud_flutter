import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:crud_flutter/model/persona.dart';


class PersonaInfo extends StatefulWidget {
  final Persona persona;
  PersonaInfo(this.persona);
  @override
  _PersonaInfoState createState() => _PersonaInfoState();
}

final personaRefencia = FirebaseDatabase.instance.reference().child('personas');

class _PersonaInfoState extends State<PersonaInfo> {

  List<Persona> items;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.persona.num);
    return Scaffold(
      appBar: AppBar(
        title: Text('Persona Informacion'),
        backgroundColor: Colors.green,
      ),
      body: Container(
        height: 400.0,
        padding: const EdgeInsets.all(20.0),
        child: Card(
          child: Center(
            child: Column(
              children: <Widget>[
                new Text("Nombre : ${widget.persona.nombre}", style: TextStyle(fontSize: 18.0),),
                Padding(padding: EdgeInsets.only(top: 8.0),),
                Divider(),
                new Text("Apellido Paterno : ${widget.persona.ap_pat}", style: TextStyle(fontSize: 18.0),),
                Padding(padding: EdgeInsets.only(top: 8.0),),
                Divider(),
                new Text("Apellido Materno : ${widget.persona.ap_mat}", style: TextStyle(fontSize: 18.0),),
                Padding(padding: EdgeInsets.only(top: 8.0),),
                Divider(),
                new Text("Numero : ${widget.persona.num}", style: TextStyle(fontSize: 18.0),),
                Padding(padding: EdgeInsets.only(top: 8.0),),
                Divider(),
                new Text("Correo : ${widget.persona.correo}", style: TextStyle(fontSize: 18.0),),
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
