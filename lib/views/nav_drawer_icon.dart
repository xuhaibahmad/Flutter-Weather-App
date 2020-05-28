import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavDrawerIcon extends StatelessWidget {
  final String menuIcon;
  final double iconSize;
  final Function onPressed;

  NavDrawerIcon({
    Key key,
    @required this.menuIcon,
    @required this.iconSize,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) => IconButton(
        icon: SvgPicture.asset(
          menuIcon,
          width: iconSize,
          height: iconSize,
          color: Colors.black87,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
