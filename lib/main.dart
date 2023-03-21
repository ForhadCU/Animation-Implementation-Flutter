import 'package:flutter/material.dart';
import 'package:my_flutter_animations/screens/anim_test.dart';
import 'package:my_flutter_animations/screens/home.dart';
import 'package:my_flutter_animations/screens/team_check.dart';
import 'package:my_flutter_animations/screens/team_check_2.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  late double scrHeight;
  late double scrWidth;

  @override
  Widget build(BuildContext context) {

    return const MaterialApp(
      title: 'Ninja Trips',
      home: TeamCheckScreen(),
      // home: Home(),
    );
  }
}
