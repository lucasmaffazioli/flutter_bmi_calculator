import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final Function callbackFunction;

  RoundIconButton({this.icon, this.callbackFunction});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: callbackFunction,
      fillColor: Color(0xFF1C2033),
      shape: CircleBorder(),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      child: Icon(
        icon,
      ),
    );
  }
}
