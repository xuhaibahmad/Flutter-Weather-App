import 'package:flutter/material.dart';
import 'package:flutter_weather_app/data/weather_api.dart';
import '../views/bottom_sheet_toggle.dart';

class WeatherSettingsSheet {
  final controller = TextEditingController();
  List<bool> isSelected = [true, false];
  String unit = CELCIUS;

  show(
    BuildContext context,
    String defaultCity,
    String defaultUnit,
    Function onSubmit,
  ) {
    final isCelcius = defaultUnit == CELCIUS;
    controller.text = defaultCity;
    isSelected = [isCelcius, !isCelcius];
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25.0),
          ),
        ),
        context: context,
        isScrollControlled: true,
        builder: (context) => Padding(
              padding: EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: buildSheetItems(
                  context,
                  onSubmit,
                ),
              ),
            ));
  }

  List<Widget> buildSheetItems(
    BuildContext context,
    Function onSubmit,
  ) {
    return [
      Text(
        "Preferences",
        style: TextStyle(
          fontSize: 20.0,
          color: Colors.black45,
          fontWeight: FontWeight.w500,
        ),
      ),
      SizedBox(height: 20.0),
      // All of this ceremony is to make the layout adjust when the keyboard opens.
      // Otherwise the keyboard hides the dialog content.
      // TODO: A good idea would be to abstract away all of this logic
      //  so in future we can reuse the bottom sheet by supplying the child layout.
      Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Flexible(child: buildCityInput()),
                SizedBox(width: 16),
                buildUnitToggle(),
              ],
            ),
            SizedBox(height: 16.0),
            SizedBox(
              width: double.infinity,
              child: RaisedButton(
                onPressed: () => onSubmit(controller.text, unit),
                color: Colors.lightBlue,
                textColor: Colors.white,
                child: Text("SAVE"),
              ),
            ),
          ],
        ),
      ),
    ];
  }

  Widget buildCityInput() {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        border: OutlineInputBorder(),
        labelStyle: TextStyle(color: Colors.grey),
        labelText: 'City',
      ),
    );
  }

  Widget buildUnitToggle() {
    return BottomSheetToggleButtons(
      selections: isSelected,
      valueChanged: (value) {
        unit = value == 0 ? CELCIUS : FAHRENHEIT;
      },
    );
  }

  dispose() {
    controller.dispose();
  }
}
