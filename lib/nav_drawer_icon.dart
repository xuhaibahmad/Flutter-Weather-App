import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavDrawerIcon extends StatelessWidget {
  const NavDrawerIcon({
    Key key,
    @required this.menuIcon,
    @required this.iconSize,
  }) : super(key: key);

  final String menuIcon;
  final double iconSize;

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
        onPressed: () => Scaffold.of(context).openDrawer(),
      ),
    );
  }
}
