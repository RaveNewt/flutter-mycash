import 'package:flutter/material.dart';
import 'package:flutter_mycash/widget/theme.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 229.0, left: 118, right: 118),
        child: Column(
          children: [
            Center(
              child: Image.asset(
                'assets/Logo.png',
                width: 180,
                height: 180,
              ),
            ),
            SizedBox(
              height: 170,
            ),
            Text(
              'My Cash',
              style: GoogleFonts.poppins(
                color: Color(0xffFFFFFF),
                fontSize: 32,
                letterSpacing: 20,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
