import 'package:flutter/material.dart';

class AnimTestScreen extends StatefulWidget {
  const AnimTestScreen({Key? key}) : super(key: key);
  @override
  _AnimTestScreenState createState() => _AnimTestScreenState();
}

class _AnimTestScreenState extends State<AnimTestScreen>
    with TickerProviderStateMixin {
  late double scrHeight;
  late double scrWidth;
  late AnimationController _animationCtrlGreen;
  late AnimationController _animationCtrlRed;
  late Animation<double> _animationHeightGreen;
  late Animation<double> _animationHeightRed;
  late Animation<double> _animationWidthGreen;
  late Animation<double> _animationWidthRed;
  late Animation<double> _animationCurveGreen;
  late Animation<double> _animationCurveRed;
  late bool isGreenExpand = false;
  late bool isRedExpand = false;
  @override
  void initState() {
    scrHeight = WidgetsBinding.instance!.window.physicalSize.height /
        2; //same as MediaQuery.of(context).size.height
    scrWidth = WidgetsBinding.instance!.window.physicalSize.width /
        2; //same as MediaQuery.of(context).size.width

//for Green Container
    _animationCtrlGreen = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));

    _animationCurveGreen = CurvedAnimation(
        parent: _animationCtrlGreen, curve: Curves.easeInOutSine);
    _animationHeightGreen =
        Tween<double>(begin: scrHeight * 0.05, end: scrHeight * 0.5)
            .animate(_animationCurveGreen);
    _animationWidthGreen =
        Tween<double>(begin: scrWidth * 0.3, end: scrWidth * 0.8)
            .animate(_animationCurveGreen);

    _animationCtrlGreen.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        //this is true when Animation do forward.
        setState(() {
          isGreenExpand = true;
          _animationCtrlRed.reverse();
        });
      } else if (status == AnimationStatus.dismissed) {
        //this is true when Animation do reversed.
        setState(() {
          isGreenExpand = false;
        });
      }
    });

    //for Red Container
    _animationCtrlRed = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    _animationCurveRed =
        CurvedAnimation(parent: _animationCtrlRed, curve: Curves.easeInOutSine);
    _animationHeightRed =
        Tween<double>(begin: scrHeight * 0.05, end: scrHeight * 0.5)
            .animate(_animationCurveRed);
    _animationWidthRed =
        Tween<double>(begin: scrWidth * 0.3, end: scrWidth * 0.8)
            .animate(_animationCurveRed);

    _animationCtrlRed.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          isRedExpand = true;
        });
      } else if (status == AnimationStatus.dismissed) {
        isRedExpand = false;
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    _animationCtrlGreen.dispose();
    _animationCtrlRed.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Join Team
            AnimatedBuilder(
              animation: _animationCtrlGreen,
              builder: (context, _) {
                return InkWell(
                  onTap: () {
                    _animationCtrlRed.reverse();
                    isGreenExpand
                        ? _animationCtrlGreen.reverse()
                        : _animationCtrlGreen.forward();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Color(0x77000000),
                              offset: Offset(4, 4),
                              blurRadius: 5,
                              spreadRadius: 0)
                        ],
                        color: Colors.greenAccent,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        )),
                    height: _animationHeightGreen.value,
                    width: _animationWidthGreen.value,
                    child: !isGreenExpand
                        ? Text("Join Team")
                        : Column(
                            children: [
                              Flexible(
                                  flex: 1,
                                  child: Container(
                                    color: Colors.amber,
                                  )),
                              Flexible(
                                  flex: 1,
                                  child: Container(
                                    color: Colors.blue,
                                  )),
                              Flexible(
                                  flex: 1,
                                  child: Container(
                                    color: Colors.orange,
                                  )),
                            ],
                          ),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),
            //Create Team
            AnimatedBuilder(
              animation: _animationCtrlRed,
              builder: (context, _) {
                return InkWell(
                  onTap: () {
                    _animationCtrlGreen.reverse();
                    isRedExpand
                        ? _animationCtrlRed.reverse()
                        : _animationCtrlRed.forward();
                  },
                  child: Container(
                    padding: EdgeInsets.all(5),
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Color(0x77000000),
                              offset: Offset(4, 4),
                              blurRadius: 5,
                              spreadRadius: 0)
                        ],
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        )),
                    height: _animationHeightRed.value,
                    width: _animationWidthRed.value,

                     child: !isRedExpand
                        ? Text("Create Team")
                        : Column(
                            children: [
                              Flexible(
                                  flex: 1,
                                  child: Container(
                                    color: Colors.green,
                                  )),
                              Flexible(
                                  flex: 1,
                                  child: Container(
                                    color: Colors.blue,
                                  )),
                              Flexible(
                                  flex: 1,
                                  child: Container(
                                    color: Colors.orange,
                                  )),
                            ],
                          ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    ));
  }
}
