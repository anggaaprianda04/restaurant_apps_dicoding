import 'package:flutter/material.dart';
import 'package:restaurant_apps_dicoding/model/restaurant.dart';
import 'package:restaurant_apps_dicoding/page/detail_restaurant.dart';
import 'package:restaurant_apps_dicoding/page/home_restaurant_page.dart';
import 'package:restaurant_apps_dicoding/page/splash_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashPage.routeName,
      routes: {
        SplashPage.routeName: (context) => SplashPage(),
        HomeRestaurantPage.routeName: (context) => HomeRestaurantPage(),
        DetailRestaurantPage.routeName: (context) => DetailRestaurantPage(
              restaurant:
                  ModalRoute.of(context).settings.arguments as Restaurant,
            )
      },
    );
  }
}
