import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:crud_flutter/model/persona.dart';

class PersonaScreen extends StatefulWidget {
  final Persona persona;
  PersonaScreen(this.persona);
  @override
  _PersonaScreenState createState() => _PersonaScreenState();
}
final personasReference = FirebaseDatabase.instance.reference().child('personas');
class _PersonaScreenState extends State<PersonaScreen> {
  List<Persona> items;
  TextEditingController _nombreController;
  TextEditingController _ap_patController;
  TextEditingController _ap_matController;
  TextEditingController _numController;
  TextEditingController _correoController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nombreController = new TextEditingController(text: widget.persona.nombre);
    _ap_patController = new TextEditingController(text: widget.persona.ap_pat);
    _ap_matController = new TextEditingController(text: widget.persona.ap_mat);
    _numController = new TextEditingController(text: widget.persona.num);
    _correoController = new TextEditingController(text: widget.persona.correo);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Personas DB'),
        backgroundColor: Colors.deepOrange,
      ),
      body: Container(
        height: 570.0,
        padding:  const EdgeInsets.all(20.0),
        child: Card(
          child: Center(
            child: Column(
              children: <Widget> [
                TextField(
                  controller: _nombreController,
                  style: TextStyle(fontSize: 17.0, color: Colors.deepOrange),
                  decoration: InputDecoration(icon: Icon(Icons.person),
                    labelText: 'Nombre'
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 8.0),),
                Divider(),
                TextField(
                  controller: _ap_patController,
                  style: TextStyle(fontSize: 17.0, color: Colors.deepOrange),
                  decoration: InputDecoration(icon: Icon(Icons.person),
                      labelText: 'Apellido paterno'
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 8.0),),
                Divider(),
                TextField(
                  controller: _ap_matController,
                  style: TextStyle(fontSize: 17.0, color: Colors.deepOrange),
                  decoration: InputDecoration(icon: Icon(Icons.person),
                      labelText: 'Apellido materno'
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 8.0),),
                Divider(),
                TextField(
                  controller: _numController,
                  style: TextStyle(fontSize: 17.0, color: Colors.deepOrange),
                  decoration: InputDecoration(icon: Icon(Icons.person),
                      labelText: 'Número'
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 8.0),),
                Divider(),
                TextField(
                  controller: _correoController,
                  style: TextStyle(fontSize: 17.0, color: Colors.deepOrange),
                  decoration: InputDecoration(icon: Icon(Icons.person),
                      labelText: 'Correo'
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 8.0),),
                Divider(),
                FlatButton(onPressed:() {
                  String nombre=_nombreController.text;
                  String materno=_ap_matController.text;
                  String paterno=_ap_patController.text;
                  String num=_numController.text;
                  String correo=_correoController.text;
                  if(widget.persona.id !=null){
                    personasReference.child(widget.persona.id).set({
                      'nombre' : nombre,
                      'ap_pat' : paterno,
                      'ap_mat' : materno,
                      'num' : num,
                      'correo' : correo,
                    }).then((_){
                      Navigator.pop(context);
                    });
                  }else {
                    personasReference.push().set({
                      'nombre' : nombre,
                      'ap_pat' : paterno,
                      'ap_mat' : materno,
                      'num' : num,
                      'correo' : correo,
                    }).then((_){
                      Navigator.pop(context);
                    });
                  }
                },
                  child: (widget.persona.id !=null) ? Text('Actualizar'):Text('Agregar')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

