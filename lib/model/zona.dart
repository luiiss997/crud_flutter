import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class Zona{
  String _id;
  String _clave;
  String _desastre;

  Zona(this._id, this._clave, this._desastre);
  Zona.map(dynamic obj){
    this._clave = obj['clave'];
    this._desastre = obj['desastre'];
  }

  String get desastre => _desastre;

  String get clave => _clave;

  String get id => _id;

  Zona.fromSnapShop(DataSnapshot snapshot){
    _id = snapshot.key;
    _clave = snapshot.value['clave'];
    _desastre = snapshot.value['desastre'];
  }
}