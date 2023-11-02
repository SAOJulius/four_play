import 'package:flutter/material.dart';

import '../../colors.dart';
import 'game_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('4 Gewinnt - Hexagonal', style: TextStyle(color: AppColors.textColor)),
        backgroundColor: AppColors.primaryColor, // Verwende die Hauptfarbe aus der colors.dart-Datei
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/logo/HEX_logo.png', width: 200, height: 200),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => GamePage()));
              },
              style: ElevatedButton.styleFrom(
                primary: AppColors.buttonColor, // Verwende die Button-Farbe aus der colors.dart-Datei
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              child: Text('Spiel starten', style: TextStyle(fontSize: 20, color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
