import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class Zona{
  String _id;
  String _clave;
  String _nombre;

  Zona(this._id, this._clave, this._nombre);
  Zona.map(dynamic obj){
    this._clave = obj['clave'];
    this._nombre = obj['nombre'];
  }

  String get nombre => _nombre;

  String get clave => _clave;

  String get id => _id;

  Zona.fromSnapShop(DataSnapshot snapshot){
    _id = snapshot.key;
    _clave = snapshot.value['clave'];
    _nombre = snapshot.value['nombre'];
  }
}