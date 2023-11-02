import 'package:flutter/material.dart';
import 'package:four_play/ui/pages/home_page.dart';

void main() {
  runApp(My4InARowApp());
}

class My4InARowApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '4 in a Row Game',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(), // Hier startet die App auf der Startseite
    );
  }
}
