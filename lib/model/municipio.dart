import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class Municipio{
  String _id;
  String _clave;
  String _nombre;
  String _significado;
  String _cabecera;
  String _superficie;
  String _altitud;
  String _clima;
  String _localizacion;

  Municipio(
      this._id,
      this._clave,
      this._nombre,
      this._significado,
      this._cabecera,
      this._superficie,
      this._altitud,
      this._clima,
      this._localizacion);

  Municipio.map(dynamic obj){
    this._clave = obj['clave'];
    this._nombre = obj['nombre'];
    this._significado = obj['significado'];
    this._cabecera = obj['cabecera'];
    this._superficie = obj['superficie'];
    this._altitud = obj['altitud'];
    this._clima = obj['clima'];
    this._localizacion = obj['localizacion'];
  }


  String get id => _id;
  String get clave => _clave;
  String get nombre => _nombre;
  String get significado => _significado;
  String get cabecera => _cabecera;
  String get superficie => _superficie;
  String get altitud => _altitud;
  String get clima => _clima;
  String get localizacion => _localizacion;

  Municipio.fromSnapShop(DataSnapshot snapshot) {
    _id = snapshot.key;
    _clave = snapshot.value['clave'];
    _nombre = snapshot.value['nombre'];
    _significado = snapshot.value['significado'];
    _cabecera = snapshot.value['cabecera'];
    _superficie = snapshot.value['superficie'];
    _altitud = snapshot.value['altitud'];
    _clima = snapshot.value['clima'];
    _localizacion = snapshot.value['localizacion'];
  }



}