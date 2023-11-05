import 'package:flutter/material.dart';

class MovingText extends StatefulWidget {
  @override
  _MovingTextState createState() => _MovingTextState();
}

class _MovingTextState extends State<MovingText> {
  double topPosition = 0.0;
  double leftPosition = 0.0;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: topPosition,
      left: leftPosition,
      child: GestureDetector(
        onPanUpdate: (details) {
          setState(() {
            topPosition += details.delta.dy;
            leftPosition += details.delta.dx;
            print(topPosition);
          });
        },
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Text(
            'Drag me!',
            style: TextStyle(
                fontSize: 40.0,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
