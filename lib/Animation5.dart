import 'package:flutter/material.dart';

class Animation5 extends StatefulWidget {
  final String animationName;

  Animation5(this.animationName);

  @override
  _BouncingAnimationState createState() => _BouncingAnimationState();
}

class _BouncingAnimationState extends State<Animation5>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool isReversed = false;
  bool isPaused = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    );

    _animation = TweenSequence(
      [
        TweenSequenceItem(
          tween: Tween(begin: -1.0, end: 1.0).chain(CurveTween(curve: Curves.linear)),
          weight: 1,
        ),
        TweenSequenceItem(
          tween: Tween(begin: 1.0, end: -1.0).chain(CurveTween(curve: Curves.linear)),
          weight: 1,
        ),
      ],
    ).animate(_controller);

    _controller.repeat(reverse: isReversed);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            double yOffset = _animation.value * 200.0;
            return Transform.translate(
              offset: Offset(0, yOffset),
              child: Image.asset(
                "./images/rocket.png",
                width: 200,
                height: 200,
              ),
            );
          },
        ),
        SizedBox(height: 10),
        Text('To Mars we go! 🚀', style: TextStyle(fontSize: 18)),
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
                _toggleBounceDirection();
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
        _controller.repeat(reverse: isReversed);
      }
    });
  }


  void _toggleBounceDirection() {
    setState(() {
      isReversed = !isReversed;
      if (isPaused) {
        _controller.reverse();
      } else {
        _controller.stop();
        if (isReversed) {
          _controller.reverse();
        } else {
          _controller.forward();
        }
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
