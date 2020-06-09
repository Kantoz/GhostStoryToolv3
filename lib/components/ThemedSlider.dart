import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'CustomSliderThumbRect.dart';

class ThemedSlider extends StatelessWidget{
  final Widget childWidget;
  final Function textFunction;

  ThemedSlider(this.childWidget, this.textFunction);

  @override
  Widget build(BuildContext context) {
    return
      SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTrackColor: Colors.blue[700],
              inactiveTrackColor: Colors.blue[100],
              trackShape: RoundedRectSliderTrackShape(),
              trackHeight: 4.0,
              thumbShape: CustomSliderThumbRect(thumbRadius: 1, thumbHeight: 40, textFunction: (double value) => textFunction(value)),
              thumbColor: Colors.blueAccent,
              overlayColor: Colors.blue.withAlpha(32),
              overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
              tickMarkShape: RoundSliderTickMarkShape(),
              activeTickMarkColor: Colors.blue[700],
              inactiveTickMarkColor: Colors.blue[100],
              valueIndicatorShape: PaddleSliderValueIndicatorShape(),
              valueIndicatorColor: Colors.blueAccent,
              valueIndicatorTextStyle: TextStyle(
                color: Colors.white,                
              ),
            ),
            child:
              childWidget
      );
              
  }
  
}