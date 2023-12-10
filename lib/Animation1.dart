import 'package:flutter/material.dart';

class Animation1 extends StatefulWidget {
  final String animationName;

  Animation1(this.animationName);

  @override
  _Animation2State createState() => _Animation2State();
}

class _Animation2State extends State<Animation1> with SingleTickerProviderStateMixin {
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
        SizedBox(height: 30),
        Text('Its getting cold! 🧊', style: TextStyle(fontSize: 18)),
        SizedBox(height: 20),
        ScaleTransition(
          scale: Tween<double>(
            begin: 1.0,
            end: 1.5,
          ).animate(CurvedAnimation(
            parent: _controller,
            curve: Curves.easeInOut,
          )),
          child: Image.asset(
            "./images/icecube.png",
            width: 200,
            height: 200,
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
