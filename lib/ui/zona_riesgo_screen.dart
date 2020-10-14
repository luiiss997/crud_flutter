import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:crud_flutter/model/zona.dart';
//Listo xd
class ZonaScreen extends StatefulWidget {
  final Zona zona;

  ZonaScreen(this.zona);

  @override
  _ZonaScreenState createState() => _ZonaScreenState();
}

final zonasReference = FirebaseDatabase.instance.reference().child('zonas');


class _ZonaScreenState extends State<ZonaScreen> {
  List<Zona> items;
  TextEditingController _claveGE;
  TextEditingController _desastreNa;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _claveGE = new TextEditingController(text: widget.zona.clave);
    _desastreNa = new TextEditingController(text: widget.zona.desastre);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
        title: Text('Zona de riesgo'),
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
    controller: _desastreNa,
    textInputAction: TextInputAction.next,
    keyboardType: TextInputType.text,
    style: TextStyle(fontSize: 17.0, color: Colors.green),
    decoration: InputDecoration(
    icon: Icon(Icons.accessible_forward_sharp),
    labelText: 'Desastre natural'),
    ),
    Padding(
    padding: EdgeInsets.only(top: 8.0),
    ),
    Divider(),
    FlatButton(
    onPressed: () {
    String clv = _claveGE.text;
    String desas = _desastreNa.text;


    if (widget.zona.id != null) {
    zonasReference.child(widget.zona.id).set({
    'clave': clv,
    'nombre': desas,
    }).then((_) {
    });
    } else {
    zonasReference.push().set({
    'clave': clv,
    'nombre': desas,
    }).then((_) {
    });
    }
    },
    child: (widget.zona.id != null)
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

