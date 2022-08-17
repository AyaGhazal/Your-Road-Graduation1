// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:second/edit.dart';
import 'package:second/edit_name.dart';

import 'edit_location.dart';
import 'home.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key,required this.name,required this.lat,required this.lng,required this.age,required this.point}) : super(key: key);

    final name;
    final double lat;
    final double lng;
    final int age;
    final int point;

  @override
Widget build(BuildContext context) {
    
    return Scaffold(
     
      body: Container(
        alignment: Alignment.center,
       child:
          
     
          Column(
              

            mainAxisAlignment: MainAxisAlignment.center,
            children: [
         
              Container(
                
                //height: 450,
                width: double.infinity,
               // margin: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                 // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                   // padding: const EdgeInsets.all(10),
                    // ignore: unnecessary_new
                    child: new Directionality(
            textDirection: TextDirection.rtl,
            child: TextField(
            textAlign: TextAlign.right,
         enabled:false,
            obscureText: true,
            // ignore: prefer_const_constructors, unnecessary_new
            decoration: new InputDecoration(
                border: OutlineInputBorder(
                 
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                              ),
              labelStyle: TextStyle(color: Colors.black),
                         labelText:"عدد النقاط : "+"$point",
                       
                      
                        ),
              )),
                          ),
                          Padding(
                padding: EdgeInsets.all(20),
              
              ),                           
                    // ignore: avoid_unnecessary_containers
                    Container(
                   // padding: const EdgeInsets.all(10),
                    child: Directionality(
            textDirection: TextDirection.rtl,
            child: TextField(
            textAlign: TextAlign.right,
           enabled:true,
            //controller: _textEdittingControler_bookName,
            obscureText: true,
            // ignore: prefer_const_constructors, unnecessary_new
            decoration: new InputDecoration(
                border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                              ),
              labelStyle: TextStyle(color: Colors.black),
                            labelText:"الاسم :"  +"$name",
                      icon:IconButton(onPressed: (){
                    
                             Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>editname()),
                      );
                    }, icon: const Icon(Icons.edit),
                        ),
                        ),
              )),
                          ),
                
                     Container(
                   // padding: const EdgeInsets.all(10),
                    child: Directionality(
            textDirection: TextDirection.rtl,
            child: TextField(
            textAlign: TextAlign.right,
            enabled:true,
            //controller: _textEdittingControler_bookName,
            obscureText: true,
            // ignore: prefer_const_constructors, unnecessary_new
            decoration: new InputDecoration(
                border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                              ),
              labelStyle: TextStyle(color: Colors.black),
                           labelText:"موقعي :"  +"$lat"+" , "+"$lng",
                       icon:IconButton(onPressed: (){
                        Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>editlocation()),
                      );

                    }, icon: const Icon(Icons.edit)),
                      
                        ),
              )),
                          ),
                    Container(
                   // padding: const EdgeInsets.all(10),
                    child: Directionality(
            textDirection: TextDirection.rtl,
            child: TextField(
            textAlign: TextAlign.right,
      enabled:true,
            //controller: _textEdittingControler_bookName,
            obscureText: true,
            // ignore: prefer_const_constructors, unnecessary_new
            decoration: new InputDecoration(
                border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                              ),
              labelStyle: TextStyle(color: Colors.black),
                                 labelText:"العمر : "+"$age",
                     icon:IconButton(onPressed: (){
                           Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>edit()),
                      );
                     

                    }, icon: const Icon(Icons.edit)),
                      
                        ),
              )),
                          ),
                     
                   
                  ],
                ),
              )
            ],
          ),
     
        
        
      ),
    );
  }
}

class HeaderCurvedContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.green;
    Path path = Path()
      ..relativeLineTo(0, 150)
      ..quadraticBezierTo(size.width / 2, 255, size.width, 150)
      ..relativeLineTo(0, -150)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}