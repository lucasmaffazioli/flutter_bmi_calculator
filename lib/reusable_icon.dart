import 'package:flutter/material.dart';
import 'consts.dart';

class ReusableIcon extends StatelessWidget {
  ReusableIcon({@required this.icon, @required this.text, this.color});

  final IconData icon;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          color: color,
          size: 68,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          text,
          style: kLabelText.copyWith(color: color),
        ),
      ],
    );
  }
}
