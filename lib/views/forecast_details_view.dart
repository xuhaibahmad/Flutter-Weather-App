import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_weather_app/data/weather_api.dart';
import 'package:flutter_weather_app/models/forecast_details_viewmodel.dart';
import 'package:flutter_weather_app/views/forecast_detail_text_view.dart';
import 'package:flutter_weather_app/views/temperature_text.dart';

class ForecastDetailsView extends StatefulWidget {
  final ForecastDetailsViewModel viewModel;
  const ForecastDetailsView({
    Key key,
    @required this.viewModel,
  }) : super(key: key);

  @override
  _ForecastDetailsViewState createState() => _ForecastDetailsViewState();
}

class _ForecastDetailsViewState extends State<ForecastDetailsView>
    with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text(
            widget.viewModel.date,
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.black38,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            widget.viewModel.location,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.black87,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 32),
          TemperatureText(
            text: widget.viewModel.temperature,
            colorPrimary: Colors.amber,
            colorSecondary: Colors.amber,
            fontWeightPrimary: FontWeight.w500,
            fontWeightSecondary: FontWeight.w400,
            fontSize: 40.0,
            mainAxisAlignment: MainAxisAlignment.start,
            unit: CELCIUS,
          ),
          Text(
            widget.viewModel.description,
            style: TextStyle(
              fontSize: 28.0,
              color: Colors.black54,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 32),
          Container(
            child: TabBar(
              controller: controller,
              indicatorColor: Colors.white,
              unselectedLabelColor: Colors.black54,
              labelColor: Colors.black87,
              tabs: [
                Text("Today", style: TextStyle(fontSize: 20.0)),
                Text("This Week", style: TextStyle(fontSize: 20.0)),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: controller,
              children: <Widget>[
                buildTodayDetails(),
                buildWeekDetails(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildWeekDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Divider(height: 8, thickness: 1),
        SizedBox(height: 32),
        Text(
          "Forecast",
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.black87,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Text(
                  "Day",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black87,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Text(
                    "Min",
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                    ),
                  )),
              Expanded(
                  flex: 1,
                  child: Text(
                    "Max",
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black54,
                      fontWeight: FontWeight.w500,
                    ),
                  )),
              Expanded(
                flex: 1,
                child: Text(""),
              ),
            ],
          ),
        ),
        Divider(height: 8, thickness: 1),
        SizedBox(height: 8),
        Expanded(
          child: ListView.builder(
            itemCount: widget.viewModel.weekTemps.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) => buildWeekForecastListItem(index),
          ),
        ),
      ],
    );
  }

  Widget buildTodayDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Divider(height: 8, thickness: 1),
        SizedBox(height: 32),
        Text(
          "Temperatures",
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.black87,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 24),
        SizedBox(
          height: 100,
          child: ListView.builder(
            itemCount: widget.viewModel.todayTemps.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => buildTodayForecastListItem(index),
          ),
        ),
        SizedBox(height: 24),
        Text(
          "Details",
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.black87,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 24),
        Row(
          children: [
            ForecastDetailTextView(
              label: "Minimum",
              value: widget.viewModel.minTemp,
            ),
            ForecastDetailTextView(
              label: "Maximum",
              value: widget.viewModel.maxTemp,
            ),
          ],
        ),
        Divider(height: 24, thickness: 1),
        Row(
          children: [
            ForecastDetailTextView(
              label: "Pressure",
              value: widget.viewModel.pressure,
            ),
            ForecastDetailTextView(
              label: "Humidity",
              value: widget.viewModel.humidity,
            )
          ],
        ),
        Divider(height: 12, thickness: 1),
      ],
    );
  }

  Widget buildWeekForecastListItem(int index) {
    final item = widget.viewModel.weekTemps[index];
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Text(
              item.day,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black87,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Expanded(
              flex: 1,
              child: Text(
                item.minTemp,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                ),
              )),
          Expanded(
              flex: 1,
              child: Text(
                item.maxTemp,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black54,
                  fontWeight: FontWeight.w500,
                ),
              )),
          Expanded(
            flex: 1,
            child: SvgPicture.asset(
              item.icon,
              width: 24,
              height: 24,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTodayForecastListItem(int index) {
    final item = widget.viewModel.todayTemps[index];
    return Container(
      margin: EdgeInsets.all(8),
      width: 60.0,
      child: Column(
        children: <Widget>[
          Text(
            item.time,
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.black54,
              fontWeight: FontWeight.w500,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(
              item.icon,
              width: 24,
              height: 24,
            ),
          ),
          TemperatureText(
            text: item.temperature,
            fontSize: 16,
            colorPrimary: Colors.black87,
            colorSecondary: Colors.black87,
            fontWeightPrimary: FontWeight.w700,
            fontWeightSecondary: FontWeight.w600,
          ),
        ],
      ),
    );
  }
}
