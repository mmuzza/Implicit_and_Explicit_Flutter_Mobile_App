import 'package:flutter/material.dart';

class Animation2 extends StatefulWidget {
  final String animationName;

  Animation2(this.animationName);

  @override
  _Animation2State createState() => _Animation2State();
}

class _Animation2State extends State<Animation2> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RotationTransition(
          turns: _controller,
          child: Image.asset(
            "./images/soccer.png",
            width: 200,
            height: 200,
          ),
        ),
        SizedBox(height: 10),
        Text('Roll, roll, roll the ball...gently down the street ⚽', style: TextStyle(fontSize: 18)),
        SizedBox(height: 20),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

