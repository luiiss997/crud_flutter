import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:crud_flutter/model/municipio.dart';
import 'package:crud_flutter/model/aspectos.dart';

class MunicipioScreen extends StatefulWidget {
  final Municipio municipio;
  final Aspecto aspecto;

  MunicipioScreen(this.municipio, this.aspecto);

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
  TextEditingController _elevado;
  TextEditingController _rio;
  TextEditingController _cuerpoagua;
  TextEditingController _poblacion;
  TextEditingController _extenso;
  TextEditingController _industrial;

  String poblacion;
  int _value=1;
  List<String> lista = [
    "Menor a 15,000",
    "15,000 - 50,000",
    "50,000 - 250,000",
    "250,000 - 500,000",
    "500,000 - 1,000,000",
    "Mayor a 10K2"];

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
    _elevado = new TextEditingController(text: widget.aspecto.elevado);
    _cuerpoagua = new TextEditingController(text: widget.aspecto.cuerpoagua);
    _poblacion = new TextEditingController(text: widget.aspecto.poblacion);
    _extenso = new TextEditingController(text: widget.aspecto.extenso);
    _industrial = new TextEditingController(text: widget.aspecto.industrializado);
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
        height: 800.0,
        padding: const EdgeInsets.all(20.0),
        child: Card(
          child: Center(
            child:
            SingleChildScrollView(
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
                Divider(),//AQUI VA EL LABEL
                TextField(
                  controller: _elevado,//OBJ ASPECTO
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontSize: 17.0, color: Colors.green),
                  decoration: InputDecoration(
                      icon: Icon(Icons.email), labelText: 'Elevación'),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                ),
                Divider(),
                TextField(
                  controller: _rio,//OBJ ASPECTO
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontSize: 17.0, color: Colors.green),
                  decoration: InputDecoration(
                      icon: Icon(Icons.email), labelText: 'Rio o Canal'),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                ),
                Divider(),
                TextField(
                  controller: _cuerpoagua,//OBJ ASPECTO
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontSize: 17.0, color: Colors.green),
                  decoration: InputDecoration(
                      icon: Icon(Icons.email), labelText: 'Cuerpo de Agua'),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                ),
                Divider(),
                DropdownButton(
                    value: _poblacion,//OBJ ASPECTO
                    items: [
                      DropdownMenuItem(
                        child: Text("Menor a 50,000"),
                        value: 1,
                      ),
                      DropdownMenuItem(
                        child: Text("50,000 - 500,000"),
                        value: 2,
                      ),
                      DropdownMenuItem(
                          child: Text("50,000 - 1,000,000"),
                          value: 3
                      ),
                      DropdownMenuItem(
                          child: Text("Mayor a 1,000,000"),
                          value: 4
                      )
                    ],
                    onChanged: (value) {
                      setState(() {
                        _poblacion = value;
                      });
                    }),
                TextField(
                  controller: _extenso,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontSize: 17.0, color: Colors.green),
                  decoration: InputDecoration(
                      icon: Icon(Icons.email), labelText: 'Extención'),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                ),
                TextField(
                  controller: _industrial,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontSize: 17.0, color: Colors.green),
                  decoration: InputDecoration(
                      icon: Icon(Icons.email), labelText: 'Industrializado'),
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
                      String ele=_elevado.text;
                      String rio=_rio.text;
                      String cuerp=_cuerpoagua.text;
                      String pob=_poblacion.text;
                      String ext=_extenso.text;
                      String ind=_industrial.text;

                      if (widget.municipio.id != null) {
                        municipiosReference.child(widget.municipio.id).set({
                          'clave': clv,
                          'nombre': mun,
                          'significado': sign,
                          'cabecera': cabe,
                          'superficie': superf,
                          'altitud': alt,
                          'clima': clima,
                          'localizacion': loca,
                        }).then((_) {
                          //Navigator.pop(context);
                        });
                      } else {
                        municipiosReference.push().set({
                          'clave': clv,
                          'nombre': mun,
                          'significado': sign,
                          'cabecera': cabe,
                          'superficie': superf,
                          'altitud': alt,
                          'clima': clima,
                          'localizacion': loca,
                        }).then((_) {
                          //Navigator.pop(context);
                        });
                      }
                      if(widget.aspecto.id != null){
                        municipiosReference.child(widget.municipio.id)
                            .child(widget.aspecto.id).set({
                          'elevado': ele,
                          'rio': rio,
                          'cuerpoagua': cuerp,
                          'poblacion': pob,
                          'extenso': ext,
                          'industrializado': ind,
                        }).then((_) {
                          Navigator.pop(context);
                        });
                      }else{
                        municipiosReference.child(widget.municipio.id)
                            .child(widget.aspecto.id).push().set({
                          'elevado': ele,
                          'rio': rio,
                          'cuerpoagua': cuerp,
                          'poblacion': pob,
                          'extenso': ext,
                          'industrializado': ind,
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
      ),
    );
  }
}
