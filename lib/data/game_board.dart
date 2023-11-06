import 'dart:math';

class GameBoard {
  Map<String, bool> fieldOccupancy = {};

  GameBoard(int radius) {
    // Initialisiere das fieldOccupancy-Dictionary entsprechend dem hexagonalen Raster.
    for (int q = -radius; q <= radius; q++) {
      int r1 = max(-radius, -q - radius);
      int r2 = min(radius, -q + radius);
      for (int r = r1; r <= r2; r++) {
        fieldOccupancy['$q,$r'] = false;
      }
    }
  }

  List<int> assignAvailableCoordinateInRow(List<int> startingCoordinates) {
      int q = startingCoordinates[0];
      int r = startingCoordinates[1];

      if (q == 3 && r == -3) {
        for (int i = 0; i >= r; i--){
            if (isFieldOccupied(q, i) == false) {
              occupyField(q, i);
              return [q, i];
            } else {

            }
        }
      } else if (q == -3 && r == 0) {
        for (int i = 3; i >= r; i--){
          if (isFieldOccupied(q, i) == false) {
            occupyField(q, i);
            return [q, i];
          }
        }
      } else if (q == -2 && r == -1) {
        for (int i = 3; i >= r; i--){
          if (isFieldOccupied(q, i) == false) {
            occupyField(q, i);
            return [q, i];
          }
        }
      } else if (q == 2 && r == -3) {
        for (int i = 1; i >= r; i--){
          if (isFieldOccupied(q, i) == false) {
            occupyField(q, i);
            return [q, i];
          }
        }
      } else if (q == -1 && r == -2) {
        for (int i = 3; i >= r; i--){
          if (isFieldOccupied(q, i) == false) {
            occupyField(q, i);
            return [q, i];
          }
        }
      } else if (q == 1 && r == -3) {
        for (int i = 2; i >= r; i--){
          if (isFieldOccupied(q, i) == false) {
            occupyField(q, i);
            return [q, i];
          }
        }
      } else if (q == 0 && r == -3) {
        for (int i = 3; i >= r; i--){
          if (isFieldOccupied(q, i) == false) {
            occupyField(q, i);
            return [q, i];
          }
        }
      }

    return [];
  }

  // Methode zum Prüfen, ob ein Feld mit den Koordinaten (q, r) belegt ist.
  bool isFieldOccupied(int q, int r) {
    String coordinateKey = '$q,$r';
    return fieldOccupancy[coordinateKey] ?? false;
  }

  // Methode zum Belegen eines Feldes mit den Koordinaten (q, r).
  void occupyField(int q, int r) {
    String coordinateKey = '$q,$r';
    fieldOccupancy[coordinateKey] = true;
  }
}
