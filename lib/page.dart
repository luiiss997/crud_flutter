import 'package:flutter/material.dart';

class Pintar extends StatefulWidget{
  @override
  _PintarState createState() => _PintarState();
}

class _PintarState extends State<Pintar>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Te haz logeado tio uwu'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Text('Hola OGT, OSI OSI 7W7'),
          )
        ],
      ),
    );
  }
}