library flutter_switch;

import 'package:flutter/material.dart';

class CustomSwitchButton extends StatefulWidget {
  final bool value, showOnOff;
  final String onText, offText;
  final ValueChanged<bool> onToggle;
  final Color activeColor,
      inactiveColor,
      activeTextColor,
      inactiveTextColor,
      toggleColor;
  final double width, height, toggleSize, valueFontSize, borderRadius, padding;

  const CustomSwitchButton({
    Key key,
    this.value,
    this.onToggle,
    this.activeColor = Colors.blue,
    this.inactiveColor = Colors.red,
    this.activeTextColor = Colors.white70,
    this.inactiveTextColor = Colors.white70,
    this.toggleColor = Colors.white,
    this.width = 70.0,
    this.height = 35.0,
    this.toggleSize = 25.0,
    this.valueFontSize = 16.0,
    this.borderRadius = 20.0,
    this.padding = 4.0,
    this.showOnOff = false,
    this.onText = 'ON',
    this.offText = 'OFF'
  }) : super(key: key);

  @override
  _FlutterSwitchState createState() => _FlutterSwitchState();
}

class _FlutterSwitchState extends State<CustomSwitchButton>
    with SingleTickerProviderStateMixin {
  Animation _toggleAnimation;
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 60),
    );
    _toggleAnimation = AlignmentTween(
      begin: widget.value ? Alignment.centerRight : Alignment.centerLeft,
      end: widget.value ? Alignment.centerLeft : Alignment.centerRight,
    ).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.linear),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            if (_animationController.isCompleted) {
              _animationController.reverse();
            } else {
              _animationController.forward();
            }
            widget.value == false
                ? widget.onToggle(true)
                : widget.onToggle(false);
          },
          child: Container(
            width: widget.width,
            height: widget.height,
            padding: EdgeInsets.all(widget.padding),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(widget.borderRadius),
              color: _toggleAnimation.value == Alignment.centerLeft
                  ? widget.inactiveColor
                  : widget.activeColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _toggleAnimation.value == Alignment.centerRight
                    ? Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 4.0),
                          child: Text(
                            widget.showOnOff ? widget.onText : "",
                            style: TextStyle(
                              color: widget.activeTextColor,
                              fontWeight: FontWeight.w900,
                              fontSize: widget.valueFontSize,
                            ),
                          ),
                        ),
                      )
                    : Container(),
                Align(
                  alignment: _toggleAnimation.value,
                  child: Container(
                    width: widget.toggleSize,
                    height: widget.toggleSize,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: widget.toggleColor,
                    ),
                  ),
                ),
                _toggleAnimation.value == Alignment.centerLeft
                    ? Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 4.0),
                          alignment: Alignment.centerRight,
                          child: Text(
                            widget.showOnOff ? widget.offText : "",
                            style: TextStyle(
                              color: widget.inactiveTextColor,
                              fontWeight: FontWeight.w900,
                              fontSize: widget.valueFontSize,
                            ),
                          ),
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
        );
      },
    );
  }
}