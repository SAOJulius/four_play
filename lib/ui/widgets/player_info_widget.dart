import 'package:flutter/material.dart';
import 'package:hexagon/hexagon.dart';
import '../../colors.dart';

class PlayerInfo extends StatelessWidget {
  final Color playerColor;
  final String playerName;

  PlayerInfo({required this.playerColor, required this.playerName});

@override
Widget build(BuildContext context) {
  return Container(
    width: 155, // Anpassen an die Größe der Boxen
    height: 70,
    decoration: BoxDecoration(
      color: AppColors.primaryColor, // Hintergrundfarbe
      borderRadius: BorderRadius.circular(7.0), // Runde die Ecken ab
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(2),
          child: HexagonWidget.flat(
            width: 57,
            color: playerColor,
            cornerRadius: 8.0,
          ),
        ),
        Text(
          playerName,
          style: TextStyle(fontSize: 20, color: AppColors.textColor),
        ),
      ],
    ),
  );
}
}
