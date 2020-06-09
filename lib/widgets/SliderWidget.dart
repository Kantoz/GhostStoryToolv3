import 'package:flutter/material.dart';
import 'package:ghost_story_tools_v3/components/ThemedSlider.dart';

class SliderWidget extends StatelessWidget{

  final Widget _childWidget;
  final Function _textFunction;
  final String _title;
  final double _paddingTop;

  SliderWidget(this._childWidget, this._textFunction, this._title, this._paddingTop);

  @override
  Widget build(BuildContext context) => 
    Container(
      padding: EdgeInsets.only(top: _paddingTop),
      child:
        Column(children: 
          <Widget>[
            Text(_title),
            ThemedSlider(_childWidget,(double value) => _textFunction(value))
          ],
        )
    );


}