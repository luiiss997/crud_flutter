//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'dart:async';
import 'package:crud_flutter/model/municipio.dart';
 class ListViewMunicipios2 extends StatefulWidget {
   @override
   _ListViewMunicipios2State createState() => _ListViewMunicipios2State();
 }
final municipiosReference = FirebaseDatabase.instance.reference().child('municipios');
 class _ListViewMunicipios2State extends State<ListViewMunicipios2> {
   List<Municipio> items;
   StreamSubscription<Event> _onMunicipioAddedSubscripcion;
   StreamSubscription<Event> _onMunicipioCambioSubscripcion;
   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    items = new List();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
   // _onMunicipioAddedSubscripcion;
    //_onMunicipioCambioSubscripcion;
  }
   @override
   Widget build(BuildContext context) {
     return MaterialApp(
       title: 'Municipios',
       home: Scaffold(
         appBar: AppBar(
           title: Text('Información'),
           centerTitle: true,
           backgroundColor: Colors.lightBlue,
         ),
         body: Center(
           child: ListView.builder(itemCount: items.length,
               padding: EdgeInsets.only(top: 12.0),
               itemBuilder: (context, position){
                 return Column(
                   children: <Widget>[
                     Divider(height: 7.0,),
                     Row(children: <Widget>[
                       Expanded(child: ListTile(title: Text('${items[position].nombre}',
                         style: TextStyle(color: Colors.blueAccent, fontSize: 21.0),
                       ),
                         subtitle: Text('${items[position].clave}',
                           style: TextStyle(
                               color: Colors.blueAccent,
                               fontSize: 21.0
                           ),
                         ),
                         leading: Column(
                           children: <Widget>[
                             CircleAvatar(
                               backgroundColor: Colors.amberAccent,
                               radius: 17.0,
                               child: Text('${items[position].significado}',
                                 style: TextStyle(
                                     color: Colors.blueAccent,
                                     fontSize: 21.0
                                 ),
                               ),
                             )
                           ],
                         ),
                       )),
                     ],
                     ),
                   ],
                 );
               }
           ),
         ),
       ),
     );
   }

 }
 