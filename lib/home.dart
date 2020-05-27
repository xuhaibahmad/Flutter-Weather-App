import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import './nav_drawer_icon.dart';
import './nav_drawer.dart';
import './next_day_mini_forecast.dart';
import './temperature_text.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final menuIcon = 'assets/menu.svg';
    final menuIconSize = 24.0;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: NavDrawerIcon(
          menuIcon: menuIcon,
          iconSize: menuIconSize,
        ),
      ),
      drawer: NavDrawer(),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  'Sunny',
                  style: TextStyle(
                    fontSize: 40.0,
                    color: Colors.black87,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  'New York',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black38,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Icon(
                  FlutterIcons.circle_faw,
                  color: Colors.yellow,
                  size: 330,
                ),
                TemperatureText(
                  text: "28",
                  fontSize: 40.0,
                ),
              ],
            ),
            NextDayMiniForecast(),
          ],
        ),
      ),
    );
  }
}
