

import 'package:flutter/material.dart';
import 'package:second/LogIn.dart';
import 'package:second/StartPage.dart';
//import 'package:shared_preferences/shared_preferences.dart';
import 'package:second/body.dart';
import 'package:second/sign.dart';
//import 'package:mongo_dart/mongo_dart.dart' show Db, DbCollection;
import 'package:shared_preferences/shared_preferences.dart';

import 'home.dart';


late  SharedPreferences shared;





void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  shared=await SharedPreferences.getInstance();
  
   runApp(MyApp());}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      initialRoute: shared.getString("id")==null? "start":"home",
      routes: {
        "start":(context)=>StartPage(),
        "login":(context)=>LogIn(),
        "home":(context)=>home(),
      },
     
    );
  }
}


