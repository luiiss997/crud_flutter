import 'package:flutter/material.dart';
import 'package:crud_flutter/loginemail.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      title: 'Google Sign In',
      home: LoginPage(),
    ),
  );
}