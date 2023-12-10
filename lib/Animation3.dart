import 'package:flutter/material.dart';

class Animation3 extends StatefulWidget {
  final String animationName;

  Animation3(this.animationName);

  @override
  _Animation2State createState() => _Animation2State();
}

class _Animation2State extends State<Animation3> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 50),
        SlideTransition(
          position: Tween<Offset>(
            begin: Offset(0.0, 0.0),
            end: Offset(0.0, -1.0),
          ).animate(CurvedAnimation(
            parent: _controller,
            curve: Curves.easeInOut,
          )),
          child: Image.asset(
            "./images/basketball.png",
            width: 200,
            height: 200,
          ),
        ),
        SizedBox(height: 10),
        Text('Lets go and dribble the ball 🏀', style: TextStyle(fontSize: 18)),
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
