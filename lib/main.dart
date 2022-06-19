import 'package:flutter/material.dart';
import 'package:flutter_mycash/components/NavBar/navbar.dart';
import 'package:flutter_mycash/pages/Add/addTransaction.dart';
import 'package:flutter_mycash/pages/Auth/Signin.dart';
import 'package:flutter_mycash/pages/Auth/Signup.dart';
import 'package:flutter_mycash/pages/Home/Dashboard2.dart';
import 'package:flutter_mycash/pages/Home/Home.dart';
import 'package:flutter_mycash/pages/Splash/SplashScreen.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('money');
  runApp(MyCash());
}

class MyCash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: addTransaction(),
      routes: {
        '/': (context) => SplashScreen(),
        '/signup': (context) => Signup(),
        '/mainPage': (context) => Dashboard(),
        '/nav': (context) => Navbar(),
      },
    );
  }
}
