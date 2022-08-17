
import 'package:second/NotificationPage%20.dart';
import 'componant/DefaultAppBar.dart';
import 'componant/DefaultBackButton .dart';
import 'componant/NotificationTiles .dart';

import 'package:flutter/material.dart';


class NotificationList extends StatefulWidget {


  @override
  _NotificationListState createState() => _NotificationListState();
}

class _NotificationListState extends State<NotificationList> {
  get keyy => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: DefaultAppBar(
        title: 'الاشعارات',
        key: keyy,
        child: DefaultBackButton(key: keyy,),
      ),
      body: ListView.separated(
          physics: ClampingScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: 2,
          itemBuilder: (context, index) {
            return NotificationTiles(
              title: 'تعبيد',
              subtitle: '..سيتم تعبيد الطريق نظرا لسوء في حالته، يرجى تحويل الطريق',
              enable: true,
              onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => NotificationPage(key: keyy,))), key: keyy,
            );
          },
          separatorBuilder: (context, index) {
            return Divider();
          }),
    );
  }
}