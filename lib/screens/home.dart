import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_weather_app/state/weather_store.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import '../views/nav_drawer_icon.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../views/forecast_view.dart';
import './weather_settings.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  WeatherStore store;
  List<ReactionDisposer> _disposers;

  final bottomSheet = WeatherSettingsSheet();

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    store ??= Provider.of<WeatherStore>(context);
    _disposers ??= [
      reaction(
        (_) => store.error,
        (message) => showInSnackBar(message),
      )
    ];
    store.assignPrefs();
    store.getForecast();
  }

  @override
  void dispose() {
    _disposers.forEach((disposer) => disposer());
    bottomSheet.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final menuIcon = 'assets/menu.svg';
    final menuIconSize = 24.0;
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: NavDrawerIcon(
          menuIcon: menuIcon,
          iconSize: menuIconSize,
          onPressed: () => bottomSheet.show(
            context,
            (city, unit) => onSubmit(city, unit),
          ),
        ),
      ),
      //drawer: NavDrawer(),
      body: Observer(
        builder: (_) {
          switch (store.state) {
            case StoreState.initial:
            case StoreState.loading:
              return SpinKitPulse(
                color: Colors.black38,
                size: 150.0,
              );
            case StoreState.loaded:
              return ForecastWidget(viewModel: store.forecastViewModel);
          }
        },
      ),
    );
  }

  onSubmit(city, unit) {
    store.updateCity(city);
    store.updateUnit(unit);
    store.getForecast();
    Navigator.pop(context);
  }

  showInSnackBar(String message) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(message)));
  }
}
