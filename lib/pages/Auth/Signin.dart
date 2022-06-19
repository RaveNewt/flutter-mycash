import 'package:flutter/material.dart';
import 'package:flutter_mycash/components/NavBar/navbar.dart';
import 'package:flutter_mycash/pages/Auth/Signup.dart';
import 'package:flutter_mycash/pages/Auth/user.dart';
import 'package:flutter_mycash/pages/Home/Home.dart';
import 'package:flutter_mycash/widget/theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class Signin extends StatefulWidget {
  Signin({Key? key}) : super(key: key);

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final _formKey = GlobalKey<FormState>();
  Future save() async {
    var res = await http.post(
        Uri.parse("http://192.168.1.28:8080/signin"),
        headers: <String, String>{
          'Context-Type': 'application/json;charSet=UTF-8'
        },
        body: <String, String>{
          'username': user.username,
          'password': user.password
        });
    print(res.body);
    Navigator.push(
        context, new MaterialPageRoute(builder: (context) => Navbar()));
  }

  User user = User('', '', '');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: blackColor,
        body: Padding(
          padding: const EdgeInsets.only(top: 70.0, left: 40, right: 40),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/Logo.png',
                  width: 50,
                ),
                SizedBox(
                  height: 70,
                ),
                Text(
                  'Welcome back. Manage your money!',
                  style: GoogleFonts.montserrat(
                      color: whiteColor,
                      fontSize: 24,
                      fontWeight: medium,
                      letterSpacing: 2),
                ),
                SizedBox(
                  height: 70,
                ),
                TextFormField(
                  controller: TextEditingController(text: user.username),
                  onChanged: (value) {
                    user.username = value;
                  },
                  validator: (String? value) {
                    if (value != null && value.isEmpty) {
                      return 'Please enter some text';
                    } else if (RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value as String)) {
                      return null;
                    } else {
                      return 'Please enter a valid email';
                    }
                  },
                  style: GoogleFonts.montserrat(
                    color: whiteColor,
                    fontSize: 14,
                  ),
                  decoration: InputDecoration(
                    fillColor: blackColor2,
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: blueColor)),
                    hintText: 'Email',
                    hintStyle: GoogleFonts.montserrat(
                      color: greyColor,
                      fontSize: 14,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: greyColor,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: blueColor,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: redColor,
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: redColor,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 32,
                ),
                TextFormField(
                  controller: TextEditingController(text: user.password),
                  onChanged: (value) {
                    user.password = value;
                  },
                  validator: (String? value) {
                    if (value != null && value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  obscureText: true,
                  style: GoogleFonts.montserrat(
                    color: whiteColor,
                    fontSize: 14,
                  ),
                  decoration: InputDecoration(
                    fillColor: blackColor2,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    hintText: 'Password',
                    hintStyle: GoogleFonts.montserrat(
                      color: greyColor,
                      fontSize: 14,
                    ),
                    suffixIcon: Icon(
                      Icons.visibility,
                      color: greyColor,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: greyColor,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: blueColor,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: redColor,
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: redColor,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
                  alignment: Alignment(1, 0.5),
                  child: Text(
                    'Forgot My Password?',
                    style: GoogleFonts.poppins(
                      color: whiteColor,
                      fontSize: 14,
                    ),
                  ),
                ),
                SizedBox(
                  height: 117,
                ),
                Center(
                  child: Container(
                    width: 295,
                    height: 55,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                          blueColor,
                          purpleColor,
                        ])),
                    child: TextButton(
                      style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30))),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          save();
                        } else {
                          print('no oke');
                        }
                      },
                      child: Text('Sign In',
                          style: GoogleFonts.openSans(
                            color: whiteColor,
                            fontWeight: semibold,
                            fontSize: 20,
                          )),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0, left: 70),
                  child: Row(
                    children: [
                      Text(
                        'Don’t have account? ',
                        style: GoogleFonts.montserrat(
                          color: whiteColor,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Signup(),
                            ),
                          );
                        },
                        child: Text(
                          'SignUp',
                          style: GoogleFonts.montserrat(
                              color: whiteColor,
                              fontSize: 14,
                              fontWeight: semibold,
                              decoration: TextDecoration.underline),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
