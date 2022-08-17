import 'dart:ui';


import 'package:flutter/material.dart';

import 'componant/DefaultAppBar.dart';
import 'componant/DefaultBackButton .dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({required Key key}) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
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
      body: FittedBox(
        child: Container(
          // height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.all(3),
          padding: EdgeInsets.all(3),
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 17, 17, 17),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [BoxShadow(color: Colors.black, blurRadius: 2.0)]),
          child: Column(
            children: [
              // ignore: prefer_const_constructors
              Text(
                  'سيتم تعبيد الطريق نظرا لسوء في حالته، يرجى تحويل الطريق',
                  style:TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
              SizedBox(height: 16.0),
              Image(image: AssetImage("logos.jpeg")),
              SizedBox(height: 16.0),
         
              SizedBox(height: 16.0), 
              Align(
                alignment: Alignment.centerRight,
                child: Text('2022-04-15',
                    style: TextStyle(color: Color.fromARGB(255, 14, 13, 13))),
              )
            ],
          ),
        ),
      ),
    );
  }
}