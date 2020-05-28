import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

/// The [BottomSheet] is a [StatelessWidget] which means components like
/// [ToggleButtons] will never receive updates.
///
/// This component solves that problem by turning the [ToggleButtons] into a
/// [StatefulWidget].
///
class BottomSheetToggleButtons extends StatefulWidget {
  BottomSheetToggleButtons({
    @required this.selections,
    @required this.valueChanged,
  });

  final List<bool> selections;
  final ValueChanged valueChanged;

  @override
  _BottomSheetToggleButtons createState() => _BottomSheetToggleButtons();
}

// TODO: Needs more generaliztion for reuse.
class _BottomSheetToggleButtons extends State<BottomSheetToggleButtons> {
  List<bool> _selections;

  @override
  void initState() {
    _selections = widget.selections;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      fillColor: Colors.grey[200],
      children: <Widget>[
        Icon(
          FlutterIcons.temperature_celsius_mco,
          color: Colors.black45,
        ),
        Icon(
          FlutterIcons.temperature_fahrenheit_mco,
          color: Colors.black45,
        ),
      ],
      onPressed: (int index) {
        setState(() {
          for (int i = 0; i < _selections.length; i++) {
            _selections[i] = i == index;
          }
          widget.valueChanged(index);
        });
      },
      isSelected: _selections,
    );
  }
}
