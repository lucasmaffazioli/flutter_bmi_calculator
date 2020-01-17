import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.color, this.child, this.tapFunction});

  final Color color;
  final Widget child;
  final Function tapFunction;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        tapFunction();
      },
      child: Container(
        child: child,
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}
