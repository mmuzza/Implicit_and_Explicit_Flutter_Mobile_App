import 'package:flutter/material.dart';

class Animation6 extends StatefulWidget {
  final String animationName;

  Animation6(this.animationName);

  @override
  _Animation2State createState() => _Animation2State();
}

class _Animation2State extends State<Animation6> with SingleTickerProviderStateMixin {
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
            return Transform.rotate(
              angle: _controller.value * (isReversed ? -2 * 3.141592653589793 : 2 * 3.141592653589793),
              child: Image.asset(
                "./images/spiderman.png",
                width: 200,
                height: 200,
              ),
            );
          },
        ),
        SizedBox(height: 10),
        Text('Watch out! Its Spiderman!', style: TextStyle(fontSize: 18)),
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
                _toggleRotationDirection();
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

  void _toggleRotationDirection() {
    setState(() {
      isReversed = !isReversed;
      _controller.duration = Duration(seconds: 2);
      _controller.repeat();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
