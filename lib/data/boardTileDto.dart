class BoardTileDto{
  final String name;
  final String imagePath;
  final String gsExtension;
  final String helpText;

  const BoardTileDto({this.name, this.imagePath, this.gsExtension, this.helpText});

  @override
  String toString() {
    return name;
  }
}