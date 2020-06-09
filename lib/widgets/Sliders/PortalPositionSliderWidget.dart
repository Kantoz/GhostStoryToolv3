import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ghost_story_tools_v3/models/pointsModel.dart';
import 'package:scoped_model/scoped_model.dart';

class PortalPositionSliderWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    
    return
      ScopedModelDescendant<PointsModel>(rebuildOnChange: true, builder: (context, child, model) => 
        Slider(
          min: 0,
          max: 2,
          value: model.portalPosition,
          divisions: 2,
          onChanged: (value) => model.setPortalPosition(value)
        )
      );
  }
}