import 'package:flutter/material.dart';
import 'package:flutter_mycash/pages/Add/addTransaction.dart';
import 'package:flutter_mycash/pages/Home/Dashboard2.dart';
import 'package:flutter_mycash/pages/Home/Home.dart';
import 'package:flutter_mycash/pages/Notif/Notification.dart';
import 'package:flutter_mycash/pages/Setting/Setting.dart';
import 'package:flutter_mycash/pages/Transaction/Transaction.dart';
import 'package:flutter_mycash/widget/theme.dart';
import 'package:google_fonts/google_fonts.dart';

class Navbar extends StatefulWidget {
  Navbar({Key? key}) : super(key: key);

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int currentTab = 0;
  final List<Widget> screens = [
    Dashboard(),
    Transaction(),
    Setting(),
    Notif(),
  ];
  Widget currentScreen = Dashboard();

  final PageStorageBucket bucket = PageStorageBucket();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageStorage(
          child: currentScreen,
          bucket: bucket,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => addTransaction()));
          },
          child: Icon(
            Icons.add,
            color: whiteColor,
          ),
          backgroundColor: purpleColor,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          color: blackColor,
          shape: CircularNotchedRectangle(),
          child: Container(
            height: 100.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                MaterialButton(
                  minWidth: 40,
                  onPressed: () {
                    setState(() {
                      currentTab = 0;
                      currentScreen = Dashboard();
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.home_filled,
                        color: currentTab == 0 ? blueColor : whiteColor,
                      ),
                      Text(
                        'Home',
                        style: TextStyle(
                            color: currentTab == 0 ? blueColor : whiteColor),
                      )
                    ],
                  ),
                ),
                MaterialButton(
                  minWidth: 40,
                  onPressed: () {
                    setState(() {
                      currentTab = 1;
                      currentScreen = Transaction();
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.money,
                        color: currentTab == 1 ? blueColor : whiteColor,
                      ),
                      Text(
                        'Transaction',
                        style: TextStyle(
                            color: currentTab == 1 ? blueColor : whiteColor),
                      )
                    ],
                  ),
                ),
                MaterialButton(
                  minWidth: 40,
                  onPressed: () {
                    setState(() {
                      currentTab = 2;
                      currentScreen = Dashboard();
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.notification_add,
                        color: currentTab == 2 ? blueColor : whiteColor,
                      ),
                      Text(
                        'Notification',
                        style: TextStyle(
                            color: currentTab == 2 ? blueColor : whiteColor),
                      )
                    ],
                  ),
                ),
                MaterialButton(
                  minWidth: 40,
                  onPressed: () {
                    setState(() {
                      currentTab = 3;
                      currentScreen = Setting();
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.settings,
                        color: currentTab == 3 ? blueColor : whiteColor,
                      ),
                      Text(
                        'Setting',
                        style: TextStyle(
                            color: currentTab == 3 ? blueColor : whiteColor),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
