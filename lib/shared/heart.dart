import 'package:flutter/material.dart';

class Heart extends StatefulWidget {
  @override
  _HeartState createState() => _HeartState();
}

class _HeartState extends State<Heart> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animationIconColor;
  late Animation<double> _animationIconSize;
  bool isClicked = false;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 500));
    _animationIconColor = ColorTween(begin: Colors.grey[400], end: Colors.red)
    .animate(_animationController); //handle icon color
    _animationIconSize = TweenSequence<double>(<TweenSequenceItem<double>>[
      TweenSequenceItem<double>(
        tween: Tween(begin: 30, end: 40),
        weight: 30,
      ),
      TweenSequenceItem<double>(tween: Tween(begin: 40, end: 30), weight: 30),
    ]).animate(_animationController);

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          isClicked = true;
        });
      } else if (status == AnimationStatus.dismissed) {
        setState(() {
          isClicked = false;
        });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animationController,
        builder: (context, _) {
          return IconButton(
            icon: Icon(
              Icons.favorite,
              color: _animationIconColor.value,
              size: _animationIconSize.value,
            ),
            onPressed: () {
              isClicked
                  ? _animationController.reverse()
                  : _animationController.forward();
            },
          );
        });
    /* IconButton(
      icon: Icon(
        Icons.favorite,
        color: _animationIconColor.value,
        size: _animationIconSize.value,
      ),
      onPressed: () {
        isClicked
            ? _animationController.reverse()
            : _animationController.forward();
      },
    ); */
  }
}
