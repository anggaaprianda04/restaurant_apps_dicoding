import 'dart:async';
import 'package:flutter/material.dart';
import 'package:restaurant_apps_dicoding/page/home_restaurant_page.dart';
import 'package:restaurant_apps_dicoding/theme.dart';

class SplashPage extends StatefulWidget {
  static const routeName = '/';

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushNamedAndRemoveUntil(
            context, HomeRestaurantPage.routeName, (route) => false));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/hamburger.png',
              width: 300,
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(25)),
              child: Text(
                'Restaurant Apps',
                style: primaryTextStyle.copyWith(
                    fontWeight: bold, fontSize: 25, color: primaryColor),
              ),
            )
          ],
        ),
      ),
    );
  }
}
