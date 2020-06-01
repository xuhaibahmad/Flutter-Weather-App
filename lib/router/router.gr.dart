// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_weather_app/screens/home.dart';
import 'package:flutter_weather_app/screens/weather_details.dart';

abstract class Routes {
  static const homePage = '/';
  static const detailsPage = '/details-page';
  static const all = {
    homePage,
    detailsPage,
  };
}

class Router extends RouterBase {
  @override
  Set<String> get allRoutes => Routes.all;

  @Deprecated('call ExtendedNavigator.ofRouter<Router>() directly')
  static ExtendedNavigatorState get navigator =>
      ExtendedNavigator.ofRouter<Router>();

  @override
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homePage:
        return MaterialPageRoute<dynamic>(
          builder: (context) => Home().wrappedRoute(context),
          settings: settings,
        );
      case Routes.detailsPage:
        return MaterialPageRoute<dynamic>(
          builder: (context) => WeatherDetails().wrappedRoute(context),
          settings: settings,
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}
