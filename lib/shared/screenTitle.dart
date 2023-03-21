import 'package:flutter/material.dart';

class ScreenTitle extends StatefulWidget {
  final String text;

  const ScreenTitle({Key? key, required this.text}) : super(key: key);

  @override
  State<ScreenTitle> createState() => _ScreenTitleState();
}

class _ScreenTitleState extends State<ScreenTitle>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animationTitleHeight;
  late Animation<double> _animationCurveTitle;

  @override
  void initState() {
    // TODO: implement initState
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    _animationCurveTitle = CurvedAnimation(
        parent: _animationController, curve: Curves.bounceInOut);
    _animationTitleHeight =
        Tween<double>(begin: 0, end: 30).animate(_animationCurveTitle);
    _animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, _) {
        return Padding(
          padding: EdgeInsets.only(top: _animationTitleHeight.value),
          child: Text(
            widget.text,
            style: TextStyle(
                fontSize: 36, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        );
      },
      /*   child: Padding(
        padding: EdgeInsets.only(top: _animationTitleHeight.value),
        child: Text(
          widget.text,
          style: TextStyle(fontSize: 36, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ), */
    );
  }
}
