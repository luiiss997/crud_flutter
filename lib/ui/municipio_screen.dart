import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:crud_flutter/model/municipio.dart';

class MunicipioScreen extends StatefulWidget {
  final Municipio municipio;

  MunicipioScreen(this.municipio);

  @override
  _MunicipioScreenState createState() => _MunicipioScreenState();
}

final municipiosReference =
    FirebaseDatabase.instance.reference().child('municipios');

class _MunicipioScreenState extends State<MunicipioScreen> {
  List<Municipio> items;
  TextEditingController _claveGE;
  TextEditingController _municipio;
  TextEditingController _significado;
  TextEditingController _cabecera;
  TextEditingController _superficie;
  TextEditingController _altitud;
  TextEditingController _clima;
  TextEditingController _localizacion;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _claveGE = new TextEditingController(text: widget.municipio.clave);
    _municipio = new TextEditingController(text: widget.municipio.nombre);
    _significado = new TextEditingController(text: widget.municipio.significado);
    _cabecera = new TextEditingController(text: widget.municipio.cabecera);
    _superficie = new TextEditingController(text: widget.municipio.superficie);
    _altitud = new TextEditingController(text: widget.municipio.altitud);
    _clima = new TextEditingController(text: widget.municipio.clima);
    _localizacion = new TextEditingController(text: widget.municipio.localizacion);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Municipio'),
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
                  controller: _claveGE,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontSize: 17.0, color: Colors.green),
                  decoration: InputDecoration(
                      icon: Icon(Icons.accessible_forward_sharp),
                      labelText: 'Clave IGECEM'),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                ),
                Divider(),
                TextField(
                  controller: _municipio,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontSize: 17.0, color: Colors.green),
                  decoration: InputDecoration(
                      icon: Icon(Icons.accessible_forward_sharp),
                      labelText: 'Municipio'),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                ),
                Divider(),
                TextField(
                  controller: _significado,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontSize: 17.0, color: Colors.green),
                  decoration: InputDecoration(
                      icon: Icon(Icons.accessible_forward_sharp),
                      labelText: 'Significado'),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                ),
                Divider(),
                TextField(
                  controller: _cabecera,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontSize: 17.0, color: Colors.green),
                  decoration: InputDecoration(
                      icon: Icon(Icons.add_call), labelText: 'Cabecera Municipal'),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                ),
                Divider(),
                TextField(
                  controller: _superficie,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontSize: 17.0, color: Colors.green),
                  decoration: InputDecoration(
                      icon: Icon(Icons.email), labelText: 'Superficie'),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                ),
                Divider(),
                TextField(
                  controller: _altitud,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontSize: 17.0, color: Colors.green),
                  decoration: InputDecoration(
                      icon: Icon(Icons.email), labelText: 'Altitud'),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                ),
                Divider(),
                TextField(
                  controller: _clima,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontSize: 17.0, color: Colors.green),
                  decoration: InputDecoration(
                      icon: Icon(Icons.email), labelText: 'Clima'),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                ),
                Divider(),
                TextField(
                  controller: _localizacion,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontSize: 17.0, color: Colors.green),
                  decoration: InputDecoration(
                      icon: Icon(Icons.email), labelText: 'Localización'),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                ),
                Divider(),
                FlatButton(
                    onPressed: () {
                      String clv = _claveGE.text;
                      String mun = _municipio.text;
                      String sign = _significado.text;
                      String cabe = _cabecera.text;
                      String superf = _superficie.text;
                      String alt = _altitud.text;
                      String clima = _clima.text;
                      String loca = _localizacion.text;

                      if (widget.municipio.id != null) {
                        municipiosReference.child(widget.municipio.id).set({
                          'id': clv,
                          'municipio': mun,
                          'significado': sign,
                          'cabecera': cabe,
                          'superficie': superf,
                          'altitud': alt,
                          'clima': clima,
                          'loca': loca,
                        }).then((_) {
                          Navigator.pop(context);
                        });
                      } else {
                        municipiosReference.push().set({
                          'id': clv,
                          'municipio': mun,
                          'significado': sign,
                          'cabecera': cabe,
                          'superficie': superf,
                          'altitud': alt,
                          'clima': clima,
                          'loca': loca,
                        }).then((_) {
                          Navigator.pop(context);
                        });
                      }
                    },
                    child: (widget.municipio.id != null)
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
