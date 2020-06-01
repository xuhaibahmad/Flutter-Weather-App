import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_weather_app/data/weather_api.dart';
import 'package:flutter_weather_app/models/forecast_details_viewmodel.dart';
import 'package:flutter_weather_app/views/forecast_detail_text_view.dart';
import 'package:flutter_weather_app/views/temperature_text.dart';

class ForecastDetailsView extends StatelessWidget {
  final ForecastDetailsViewModel viewModel;
  const ForecastDetailsView({
    Key key,
    @required this.viewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text(
            viewModel.date,
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.black38,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            viewModel.location,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.black87,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 32),
          TemperatureText(
            text: viewModel.temperature,
            colorPrimary: Colors.amber,
            colorSecondary: Colors.amber,
            fontWeightPrimary: FontWeight.w500,
            fontWeightSecondary: FontWeight.w400,
            fontSize: 40.0,
            mainAxisAlignment: MainAxisAlignment.start,
            unit: CELCIUS,
          ),
          Text(
            viewModel.description,
            style: TextStyle(
              fontSize: 28.0,
              color: Colors.black54,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 32),
          Row(
            children: <Widget>[
              FlatButton(
                onPressed: null,
                child: Text(
                  "Today",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black87,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              FlatButton(
                onPressed: null,
                child: Text(
                  "This Week",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black38,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )
            ],
          ),
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
              itemCount: viewModel.todayTemps.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => buildListItem(index),
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
                value: viewModel.minTemp,
              ),
              ForecastDetailTextView(
                label: "Maximum",
                value: viewModel.maxTemp,
              ),
            ],
          ),
          Divider(height: 24, thickness: 1),
          Row(
            children: [
              ForecastDetailTextView(
                label: "Pressure",
                value: viewModel.pressure,
              ),
              ForecastDetailTextView(
                label: "Humidity",
                value: viewModel.humidity,
              )
            ],
          ),
          Divider(height: 12, thickness: 1),
        ],
      ),
    );
  }

  Widget buildListItem(int index) {
    final item = viewModel.todayTemps[index];
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
