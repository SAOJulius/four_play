import 'package:flutter/material.dart';
import '../../colors.dart';
import '../widgets/game_board_widget.dart';
import '../widgets/player_info_widget.dart';
import 'package:provider/provider.dart';

class GamePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HexagonalGameBoardProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('4 Gewinnt - Hexagonal', style: TextStyle(color: AppColors.textColor)),
          backgroundColor: AppColors.primaryColor,
        ),
        body: Container(
          color: AppColors.backgroundColor,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    PlayerInfo(playerColor: Colors.blue, playerName: 'Spieler 1'),
                    PlayerInfo(playerColor: Colors.red, playerName: 'Spieler 2'),
                  ],
                ),
                SizedBox(height: 20),
                HexagonalGameBoard(),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Hier kannst du die Logik für das Starten eines neuen Spiels hinzufügen
                  },
                  style: ElevatedButton.styleFrom(
                    primary: AppColors.buttonColor,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  child: Text('Neues Spiel starten', style: TextStyle(fontSize: 20, color: Colors.white)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
