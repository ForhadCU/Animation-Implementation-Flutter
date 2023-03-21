import 'package:flutter/material.dart';

import '../shared/screenTitle.dart';
import '../shared/tripList.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: const AssetImage("images/bg.png"),
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.topLeft),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 10),
                const SizedBox(
                  // height: _animationController.value,
                  height: 160,
                  child: ScreenTitle(
                    text: 'Ninja Trips',
                    key: null,
                  ),
                ),

                Flexible(
                  child: TripList(),
                )
                //Sandbox(),
              ],
            )));
  }
}
