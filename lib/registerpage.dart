import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'dart:async';
import 'package:crud_flutter/model/municipio.dart';
class ListviewN extends StatefulWidget {
  @override
  _ListviewNState createState() => _ListviewNState();
}
final municipiosReference = FirebaseDatabase.instance.reference().child('municipios');
class _ListviewNState extends State<ListviewN> {
  //List<Municipio>
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
