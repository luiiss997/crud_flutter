import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class Aspecto{
  String _id;
  String _clave;
  String _elevado;
  String _rio;
  String _cuerpoagua;
  String _poblacion;
  String _extenso;
  String _industrializado;

  Aspecto(
      this._id,
      this._clave,
      this._elevado,
      this._rio,
      this._cuerpoagua,
      this._poblacion,
      this._extenso,
      this._industrializado);

  Aspecto.map(dynamic obj){
    this._elevado=obj['elevado'];
    this._rio=obj['rio'];
    this._cuerpoagua=obj['cuerpoagua'];
    this._poblacion=obj['poblacion'];
    this._extenso=obj['extenso'];
    this._industrializado=obj['industrializado'];
  }

  String get id => _id;
  String get clave => _clave;
  String get elevado => _elevado;
  String get rio => _rio;
  String get cuerpoagua => _cuerpoagua;
  String get poblacion => _poblacion;
  String get extenso => _extenso;
  String get industrializado => _industrializado;

  Aspecto.fromSnapShop(DataSnapshot snapshot) {
    _id = snapshot.key;
    _clave = snapshot.value['clave'];
    _elevado = snapshot.value['elevado'];
    _rio = snapshot.value['rio'];
    _cuerpoagua = snapshot.value['cuerpoagua'];
    _poblacion = snapshot.value['poblacion'];
    _extenso = snapshot.value['extenso'];
    _industrializado = snapshot.value['industrializado'];
  }



}