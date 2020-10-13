import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:crud_flutter/model/persona.dart';

class PersonaScreen extends StatefulWidget {
  final Persona persona;

  PersonaScreen(this.persona);

  @override
  _PersonaScreenState createState() => _PersonaScreenState();
}

final personasReference =
    FirebaseDatabase.instance.reference().child('personas');

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
        title: Text('Persona'),
        backgroundColor: Colors.green,
      ),
      body: Container(
        height: 570.0,
        padding: const EdgeInsets.all(20.0),
        child: Card(
          child: Center(
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: _nombreController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontSize: 17.0, color: Colors.green),
                  decoration: InputDecoration(
                      icon: Icon(Icons.accessible_forward_sharp),
                      labelText: 'Nombre'),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                ),
                Divider(),
                TextField(
                  controller: _ap_patController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontSize: 17.0, color: Colors.green),
                  decoration: InputDecoration(
                      icon: Icon(Icons.accessible_forward_sharp),
                      labelText: 'Apellido paterno'),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                ),
                Divider(),
                TextField(
                  controller: _ap_matController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontSize: 17.0, color: Colors.green),
                  decoration: InputDecoration(
                      icon: Icon(Icons.accessible_forward_sharp),
                      labelText: 'Apellido materno'),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                ),
                Divider(),
                TextField(
                  controller: _numController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  style: TextStyle(fontSize: 17.0, color: Colors.green),
                  decoration: InputDecoration(
                      icon: Icon(Icons.add_call), labelText: 'Número'),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                ),
                Divider(),
                TextField(
                  controller: _correoController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(fontSize: 17.0, color: Colors.green),
                  decoration: InputDecoration(
                      icon: Icon(Icons.email), labelText: 'Correo'),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                ),
                Divider(),
                FlatButton(
                    onPressed: () {
                      String nombre = _nombreController.text;
                      String materno = _ap_matController.text;
                      String paterno = _ap_patController.text;
                      String num = _numController.text;
                      String correo = _correoController.text;
                      if (widget.persona.id != null) {
                        personasReference.child(widget.persona.id).set({
                          'nombre': nombre,
                          'ap_pat': paterno,
                          'ap_mat': materno,
                          'num': num,
                          'correo': correo,
                        }).then((_) {
                          Navigator.pop(context);
                        });
                      } else {
                        personasReference.push().set({
                          'nombre': nombre,
                          'ap_pat': paterno,
                          'ap_mat': materno,
                          'num': num,
                          'correo': correo,
                        }).then((_) {
                          Navigator.pop(context);
                        });
                      }
                    },
                    child: (widget.persona.id != null)
                        ? Text('Actualizar')
                        : Text('Agregar')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
