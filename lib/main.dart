import 'package:flutter/material.dart';
import 'package:flutter_mycash/components/NavBar/navbar.dart';
import 'package:flutter_mycash/pages/Auth/Signin.dart';
import 'package:flutter_mycash/pages/Splash/SplashScreen.dart';

void main() => runApp(MyCash());

class MyCash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Signin(),
    );
  }
}
