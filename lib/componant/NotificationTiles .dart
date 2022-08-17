import 'package:flutter/material.dart';

import '../home.dart';



class NotificationTiles extends StatelessWidget {
  final String title, subtitle;
  final Function onTap;
  final bool enable;
  const NotificationTiles({
    required Key key, required this.title, required this.subtitle, required this.onTap, required this.enable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
          height: 50.0,
          width: 50.0,
          decoration: BoxDecoration(
           
            )),
      title: Text(title, style: TextStyle(color: Colors.black)),
      subtitle: Text(subtitle,
          style: TextStyle(color: Colors.white)),
      onTap:  () {
                         Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => home()),
                      );
                    },
      enabled: enable,
    );
  }
}