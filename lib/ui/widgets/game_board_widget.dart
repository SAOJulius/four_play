import 'package:flutter/material.dart';
import 'package:hexagon/hexagon.dart';
import 'package:provider/provider.dart';

import '../../colors.dart';
import '../../data/game_board.dart';
import '../../data/game_board.dart';

class HexagonalGameBoard extends StatelessWidget {
  final HexagonType type = HexagonType.FLAT;
  final int depth = 3;
  late GameBoard gameBoard;

  @override
  Widget build(BuildContext context) {
    final hexagonGridProvider = Provider.of<HexagonalGameBoardProvider>(context);

    return Padding(
      padding: EdgeInsets.all(10.0),
      child: InteractiveViewer(
        minScale: 0.2,
        maxScale: 4.0,
        child: HexagonGrid(
          hexType: type,
          color: AppColors.backgroundColor, // Hintergrundfarbe
          depth: depth,
          buildTile: (coordinates) {
            final tile = hexagonGridProvider.getHexagon(coordinates.q, coordinates.r);

            //hexagonGridProvider.changeHexagonColor(coordinates.q, coordinates.r, AppColors.primaryColor);

            return HexagonWidgetBuilder(
              color: tile?.color, // Verwende die berechnete Farbe
              padding: 2.0,
              cornerRadius: 8.0,
              child: InkWell(
                onTap: () async {
                  // Ändere die Farbe nur beim Klicken
                  if (coordinates.q == 0 && coordinates.r == -3) {
                    print(coordinates);
                    GameBoard gameBoard = GameBoard();
                    List<String> test = gameBoard.checkAndOccupyRow(0, -3);
                    print(test);
                    try {
                      hexagonGridProvider.changeHexagonColor(
                          test[0] as int, test[0] as int, Colors.red);
                    } catch (e) {
                      hexagonGridProvider.changeHexagonColor(
                          0, 3, Colors.red);
                    }
                    //for (int i = 0, value1 = -4, value2 = -3; i < 7; i++) {
                      //await Future.delayed(Duration(milliseconds: 30));
                      //hexagonGridProvider.changeHexagonColor(0, value1, Colors.white);
                      //hexagonGridProvider.changeHexagonColor(0, value2, Colors.red);
                      //value1++;
                      //value2++;
                    //}

                  } else {
                    hexagonGridProvider.changeHexagonColor(
                        coordinates.q, coordinates.r, Colors.red);
                  }
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('${coordinates.q}, ${coordinates.r}'),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}


class HexagonalGameBoardProvider with ChangeNotifier {
  late List<List<HexagonTile>> hexagonGrid;

  HexagonalGameBoardProvider() {
    initializeHexagonGrid();
  }

  void initializeHexagonGrid() {
    hexagonGrid = List.generate(
      7, // Anzahl der Spalten, so dass -3 bis 3 abgedeckt sind
          (col) => List.generate(
        7, // Anzahl der Zeilen, so dass -3 bis 3 abgedeckt sind
            (row) => HexagonTile(Colors.white),
      ),
    );
  }

  HexagonTile? getHexagon(int q, int r) {
    final rows = hexagonGrid;
    final maxR = (rows.length) ~/ 2;
    final minR = -maxR;

    if (r >= minR && r <= maxR) {
      final row = rows[r - minR];
      final maxQ = (row.length - 1) ~/ 2;
      final minQ = -maxQ;

      if (q >= minQ && q <= maxQ) {
        return row[q - minQ];
      }
    }
    return null;
  }

  void changeHexagonColor(int q, int r, Color newColor) {
    final tile = getHexagon(q, r);
    if (tile != null) {
      tile.color = newColor;
      notifyListeners();
    }
  }
}

class HexagonTile {
  Color color;

  HexagonTile(this.color);
}
