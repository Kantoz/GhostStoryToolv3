import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BoardGrid extends StatefulWidget {

  final String imagePath;
  BoardGrid({
    String imagePath
  }): this.imagePath = imagePath;

  @override
  State<StatefulWidget> createState() => new BoardGridState(imagePath);
  }

  class BoardGridState extends State<BoardGrid> {

  BoardGridState(this.imagePath);
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    BoardGridState(this.imagePath);

    return Container(child: 
      Image(image: 
        AssetImage(this.imagePath),        
      ),
    );
  }
}