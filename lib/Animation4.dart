import 'package:flutter/material.dart';

class Animation4 extends StatefulWidget {
  final String animationName;

  Animation4(this.animationName);

  @override
  _Animation2State createState() => _Animation2State();
}

class _Animation2State extends State<Animation4> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool isReversed = false;
  bool isPaused = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.scale(
              scale: 1.0 + _controller.value * (isReversed ? -0.5 : 0.5),
              child: Image.asset(
                "./images/globe.png",
                width: 200,
                height: 200,
              ),
            );
          },
        ),
        SizedBox(height: 10),
        Text('World Map 🌍', style: TextStyle(fontSize: 18)),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                _togglePause();
              },
              child: Text(isPaused ? 'Resume' : 'Pause'),
            ),
            SizedBox(width: 10),
            ElevatedButton(
              onPressed: () {
                _toggleZoomDirection();
              },
              child: Text('Reverse'),
            ),
          ],
        ),
      ],
    );
  }

  void _togglePause() {
    setState(() {
      isPaused = !isPaused;
      if (isPaused) {
        _controller.stop();
      } else {
        _controller.repeat();
      }
    });
  }

  void _toggleZoomDirection() {
    setState(() {
      isReversed = !isReversed;
      _controller.duration = Duration(seconds: 2);
      _controller.repeat(reverse: isReversed);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
