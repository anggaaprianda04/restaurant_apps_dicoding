import 'package:flutter/material.dart';
import 'package:restaurant_apps_dicoding/model/restaurant.dart';
import 'package:restaurant_apps_dicoding/theme.dart';

class DetailRestaurantPage extends StatelessWidget {
  static const routeName = '/detail-restaurant';

  final Restaurant restaurant;

  const DetailRestaurantPage({this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.chevron_left),
        ),
        title: Text(
          restaurant.name,
          style: primaryTextStyle.copyWith(fontWeight: bold),
        ),
      ),
      body: ListView(
        children: [
          Hero(
            tag: restaurant.pictureId,
            child: ClipRRect(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                child: Image.network(restaurant.pictureId)),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  restaurant.name,
                  style:
                      primaryTextStyle.copyWith(fontSize: 23, fontWeight: bold),
                ),
                SizedBox(
                  height: 3,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      size: 14,
                      color: primaryColor,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      restaurant.city,
                      style: primaryTextStyle,
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  restaurant.description,
                  style: primaryTextStyle,
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: 7,
                ),
                Text(
                  'Menu',
                  style: primaryTextStyle.copyWith(fontSize: 23),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        AlertDialog dialog = new AlertDialog(
                          content: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: restaurant.menus.foods
                                  .map((food) => Text(
                                        '${food.name}',
                                        style: primaryTextStyle,
                                      ))
                                  .toList(),
                            ),
                          ),
                        );
                        showDialog(
                          context: context,
                          builder: (context) => dialog,
                        );
                      },
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                            color: secondaryColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Text(
                            'Makanan',
                            style: primaryTextStyle,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        AlertDialog dialog = new AlertDialog(
                          content: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: restaurant.menus.drinks
                                  .map((drink) => Text(
                                        '${drink.name}',
                                        style: primaryTextStyle,
                                      ))
                                  .toList(),
                            ),
                          ),
                        );
                        showDialog(
                          context: context,
                          builder: (context) => dialog,
                        );
                      },
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                            color: secondaryColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Text(
                            'Minuman',
                            style: primaryTextStyle,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
