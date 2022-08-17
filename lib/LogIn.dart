
// ignore_for_file: prefer_const_constructors, unnecessary_new

import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:second/body.dart';
import 'package:second/home.dart';
import 'package:second/main.dart';
import 'package:second/sign.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
class LogIn extends StatefulWidget {
  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  TextEditingController nameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

 late  String email;

late String password;
late String e;
late String pass;
   Dio dio = new Dio();
 
  final logger = Logger();
 bool isLoading=false;
  GlobalKey<FormState> formstate=GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    /*  supportedLocales: [
   
    Locale("ar", "AE"), // OR Locale('ar', 'AE') OR Other RTL locales
  ],*/
        body: Stack(children: <Widget>[
      Container(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          key: formstate,
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: 0,
              bottom: 0,
              left: 0,
              right: 0,
              child: Image.asset(
                "Assets/BG.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
      Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(14),
        alignment: Alignment.center,
        
        child:ListView(
          
     children: <Widget>[ Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(60),
                  child:
                   const Text(
                    'تسجيل الدخول ',
                    style: TextStyle(fontSize: 20,color: Colors.white),
                  )),
                                  // ignore: unnecessary_new
          Container(
                padding: const EdgeInsets.all(10),
                child: new Directionality(
                    textDirection: TextDirection.rtl,
                    child: TextField(
                    textAlign: TextAlign.right,
                      controller: nameController,
                 
                   
                    // ignore: prefer_const_constructors, unnecessary_new
                    decoration: new InputDecoration(
                        border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                      ),
                      labelStyle: TextStyle(color: Colors.white),
                                labelText:" البريد الالكتروني ",
                              
                                ),
                                onChanged: (value) {
                                email = value;
                                e=email;
                                print(email);

                                       }
                      ),
                       
                      ),
                                  ),





                  // ignore: unnecessary_new
          Container(
                    padding: const EdgeInsets.all(10),
                    child: new Directionality(
            textDirection: TextDirection.rtl,
            child: TextField(
            textAlign: TextAlign.right,
              controller: passwordController,
        
            obscureText: true,
            // ignore: prefer_const_constructors, unnecessary_new
            decoration: new InputDecoration(
                border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                              ),
              labelStyle: TextStyle(color: Colors.white),
                        labelText:" كلمة السر",
                      
                        ),
                        onChanged: (value) {
                                password = value;
                           
                                print(password);
                               

                             
                                       }
              )),
                          ),
                
        
              TextButton(
                onPressed: () {
                  //forgot password screen
                },
                child: const Text(
                  'هل نسيت كلمة السر؟',
                  style: TextStyle(color: Colors.white),
                ),
              ),
          
              Container(
                  height: 70,
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  child: ElevatedButton(
                    child:  Text(
                    
                      'تسجيل الدخول',
                      style: TextStyle(color: Colors.white,fontSize: 20),
                      textDirection: TextDirection.rtl,
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                      ),

                      //side: BorderSide(style: BorderStyle.solid),
                      // shape: OutlinedBorder(),
                      primary: Color.fromARGB(172, 81, 233, 35),
                    ),
                    onPressed: () {
                    
e=email;
                      print("00");
                      print(e);
                      print("0000");
                           pass=password;
                           print(pass);

                   login(e,pass);
                      
                    },
                  )),
                          Row(
                children: <Widget>[
                  TextButton(
                    child: const Text(
                      'انشاء حساب',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black),
                    ),
                    onPressed: () {
                   
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => signup()),
                      );
                      //signup screen
                    },
                  ),
                  const Text('لا تمتلك حساب؟',style: TextStyle(color: Colors.white),),
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
          
            ])]),
      ),
    ]));
  }
  
login( e, pass) async {



print(e);

print(pass);

  String url =("http://s2p1.gis.najah.edu:8000/log");
   logger.d("url is: $url");
   try {
    print("in url");
     isLoading=true;
      setState(() {
          
        });
      Response response = await dio.post(
      url,
      
        data: jsonEncode({


  "email":e,
  "password":pass,
 


    }),
  
      );
        isLoading=false;
        setState(() {
          
        });
           print("1111111111111111111111111");
      if (response.statusCode == 200 || response.statusCode == 201) {
        shared.setString("id", response.data['user']['id'].toString());
         shared.setString("name", response.data['user']['fullname'].toString());
        print(shared.getString("id"));
      
          print("0000000000000000000000000");
        
     //   print(shared.id);
            Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => home()),
                        (route)=>false,
                      );
        logger.d("response is : ${response.data.toString()}");
        return response;
      }
    
      
    }on DioError catch (e) {
         AwesomeDialog(context: context,
        title:"حدث خطأ" ,
        body: Text(
          "يرجى التاكد من البريد الالكتروني وكلمة السر ..."
        ));
      
      logger.e("catch error : $e");
    }



}
}
