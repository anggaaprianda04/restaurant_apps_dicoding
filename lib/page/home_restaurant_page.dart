import 'package:flutter/material.dart';
import 'package:restaurant_apps_dicoding/model/restaurant.dart';
import 'package:restaurant_apps_dicoding/page/detail_restaurant.dart';
import 'package:restaurant_apps_dicoding/theme.dart';

class HomeRestaurantPage extends StatelessWidget {
  static const routeName = '/home-restaurant';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBar(
            backgroundColor: primaryColor,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Restaurant App',
                  style: primaryTextStyle.copyWith(fontWeight: bold),
                ),
                Text(
                  'Recommmendation restaurant for you',
                  style: primaryTextStyle.copyWith(fontSize: 15),
                )
              ],
            ),
          ),
        ),
        body: FutureBuilder<String>(
          future: DefaultAssetBundle.of(context)
              .loadString('assets/local_restaurant.json'),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return CircularProgressIndicator();
            } else {
              if (snapshot.hasData) {
                final List<Restaurant> restaurants = parseRes(snapshot.data);
                return ListView.builder(
                  itemCount: restaurants.length,
                  itemBuilder: (context, index) {
                    return _buildRestaurantItem(context, restaurants[index]);
                  },
                );
              } else {
                return Text('data kosong');
              }
            }
          },
        ));
  }
}

Widget _buildRestaurantItem(BuildContext context, Restaurant restaurants) {
  return ListTile(
    onTap: () {
      Navigator.pushNamed(context, DetailRestaurantPage.routeName,
          arguments: restaurants);
    },
    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    leading: Hero(
      tag: restaurants.pictureId,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
          restaurants.pictureId,
          width: 100,
          height: 100,
          fit: BoxFit.cover,
        ),
      ),
    ),
    title: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          restaurants.name,
          style: primaryTextStyle.copyWith(fontWeight: bold, fontSize: 15),
        ),
        Row(
          children: [
            Icon(
              Icons.location_on,
              size: 12,
              color: primaryColor,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              restaurants.city,
              style: primaryTextStyle.copyWith(fontSize: 12),
            ),
          ],
        ),
        SizedBox(
          height: 2,
        ),
        Row(
          children: [
            Icon(
              Icons.star,
              color: primaryColor,
              size: 12,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              restaurants.rating.toString(),
              style: primaryTextStyle.copyWith(fontSize: 12),
            ),
          ],
        )
      ],
    ),
  );
}
