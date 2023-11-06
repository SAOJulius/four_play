
class GameBoard {
  Map<String, bool> fieldOccupancy = {};

  // Methode zum Hinzufügen eines belegten Feldes mit den Koordinaten (x, y).
  void occupyField(int x, int y) {
    fieldOccupancy['$x,$y'] = true;
  }

  // Methode zum Überprüfen, ob ein Feld mit den Koordinaten (x, y) belegt ist.
  bool isFieldOccupied(int x, int y) {
    return fieldOccupancy['$x,$y'] ?? false;
  }

  // Methode zum Überprüfen und Belegen der Felder in einer Reihe.
  List<String> checkAndOccupyRow(int startX, int startY) {
    List<String> occupiedCoordinates = [];
    int x = startX;
    int y = startY;
    int step = 1;

    while (y >= 0) {
      if (!isFieldOccupied(x, y)) {
        occupyField(x, y);
        occupiedCoordinates.add('$x,$y');
      } else {
        // Markiere das vorherige Feld als belegt und bewege dich einen Schritt weiter.
        occupyField(x - step, y);
        x += step;
      }

      if (x == 0) {
        // Ändere die Richtung, wenn x den Nullpunkt erreicht hat.
        step = -step;
      }
      y++;
    }

    return occupiedCoordinates;
  }
}

