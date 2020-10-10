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

  }
}

