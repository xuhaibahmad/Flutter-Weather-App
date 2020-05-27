import 'package:flutter/material.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: ListView(
            children: <Widget>[
              ListTile(
                title: Text('Item1'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
