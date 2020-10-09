import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class Persona{
  String _id;
  String _nombre;
  String _ap_pat;
  String _ap_mat;
  String _num;
  String _correo;


  Persona(
      this._id, this._nombre, this._ap_pat, this._ap_mat, this._num, this._correo);

  Persona.map(dynamic obj){
    this._nombre= obj['nombre'];
    this._ap_pat= obj['ap_pat'];
    this._ap_mat= obj['ap_mat'];
    this._num= obj['num'];
    this._correo= obj['correo'];
  }
  String get id => _id;
  String get nombre => _nombre;
  String get correo => _correo;
  String get num => _num;
  String get ap_mat => _ap_mat;
  String get ap_pat => _ap_pat;

  Persona.fromSnapShop(DataSnapshot snapshot){
    _id = snapshot.key;
    _nombre = snapshot.value['nombre'];
    _ap_pat = snapshot.value['ap_pat'];
    _ap_mat = snapshot.value['_ap_mat'];
    _num = snapshot.value['_num'];
    _correo = snapshot.value['_correo'];
  }
}