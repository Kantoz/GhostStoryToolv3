enum PlayerColor {
  red,
  blue,
  green,
  yellow
}

class PlayerTileDto{
  final String name;
  final String imagePath;
  final String gsExtension;
  final String helpText;
  final PlayerColor color;

  const PlayerTileDto({this.name, this.imagePath, this.gsExtension, this.helpText, this.color});

  @override
  String toString() {
    return name;
  }
}