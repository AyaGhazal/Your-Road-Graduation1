

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:second/LogIn.dart';
//import 'package:flutter/services.dart';
import 'package:second/complaint.dart';

import 'package:second/main.dart';
import 'package:second/profile.dart';
import 'package:second/rating_bar.dart';
import 'package:second/sens.dart';
import 'package:second/sensor.dart';
import 'package:second/test.dart';
import 'LogIn.dart';

import 'MyBadge.dart';
import 'listnotif.dart';
import 'newprofile.dart';
import 'notif.dart';
import 'notification.dart';
//import 'package:second/sensor.dart';

class home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //centerTitle: true,
     title: "home",
           home: myhome(),
 );
 

    
  }

}
class myhome extends StatefulWidget {
  @override
  _home createState() => _home();

}

class _home extends State<myhome>  {
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        title: Text(" الصفحة الرئيسية",textDirection: TextDirection.rtl,textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        //leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back)),
       elevation: 0,
      backgroundColor: Colors.green,
      //systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.red),
      actions:[  IconButton(onPressed: (){
      
             Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => rate()),
                            );

      }, icon: Icon(Icons.star)),
        IconButton(onPressed: (){
        shared.clear;
         Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => LogIn()),
                        (route)=>false,
                      );

      }, icon: Icon(Icons.logout)),

     
      
      ]
      ),
      


      body:Stack(
             // child: ListView( 
 children: [
  
        Stack(
          children: [
            
         
    CustomPaint(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                ),
                painter: HeaderCurvedContainer(),
              ),
     
             // 
             
             Column(
               
              
                crossAxisAlignment: CrossAxisAlignment.center,
                
                children: [
                  
                   Padding(
                padding: EdgeInsets.all(10),
              
              ),
               //     ListView(children: [
             
              Row(
                

               mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
             // spacing: 30,
              //crossAxisAlignment: WrapCrossAlignment.center,
              textDirection: TextDirection.rtl,
              children: [
     
                           Container(
                    height: 230,
                        width: 150,
                        margin: const EdgeInsets.all(6), 
                      
                        child: ElevatedButton.icon(
 
                         icon: Icon(
                         
                            Icons.add_a_photo_outlined,
                              color:Colors.black,
                            ),
                            label: Text(" تسجيل شكوى",textAlign: TextAlign.right,style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.bold)),
                    
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
 
                            side: BorderSide(style: BorderStyle.solid,color:  Color.fromARGB(178, 75, 184, 11)),
                            // shape: OutlinedBorder(),
                            primary: Colors.white,
                          ),
                          onPressed: () {
                              Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>newComplaint()),
                            );
                          },
                        )),
                        Container(
                       height: 230,
                        width: 150,
                        margin: const EdgeInsets.all(6), 
                      
                        child: ElevatedButton.icon(
 
                         icon: Icon(
                            Icons.add_road_outlined,
                            color: Colors.black,
                            ),
                            label: Text(" تسجيل حالة الطريق ",textAlign: TextAlign.right,style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.bold)),
                    
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
 
                            side: BorderSide(style: BorderStyle.solid,color:  Color.fromARGB(178, 75, 184, 11)),
                            // shape: OutlinedBorder(),
                               primary: Colors.white
                          ),
                          onPressed: () {
                               Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => sens()),
                            );
                          },
                        ))]),
                        Row(
                            mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
                          children: [
                        
                       Container(
                       height: 230,
                        width: 150,
                        margin: const EdgeInsets.all(6),
                      
                        child: ElevatedButton.icon(
 
                         icon: Icon(
                            Icons.account_circle,
                            color:Colors.black,
                            ),
                            label: Text(" الصفحة الشخصية ",textAlign: TextAlign.right,style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.bold)),
                    
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
 
                            side: BorderSide(style: BorderStyle.solid,color:  Color.fromARGB(177, 75, 184, 11)),
                            primary: Colors.white,
                          ),
                          onPressed: () {
                               Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => newprofile()),
                            );
                          },
                        )),
     Container(
     child: MyBadge(
         // position: BadgePosition.topEnd(top: -10, end: -15),
        // badgeColor: Colors.red,
         /* badgeContent: Container(
            width: 30,
            height: 30,
            alignment: Alignment.center,
            child: const Text(
              '14',
              style: TextStyle(color: Colors.white),
            ),
          ),*/
             top: 10,
              right: 10,
              value: "1",
           child:      Container(
                           
                       height: 230,
                        width: 150,
                        margin: const EdgeInsets.all(6),
                      
                        child: ElevatedButton.icon(
 
                         icon: Icon(
                            Icons.notifications_outlined,
                            color: Colors.black,
                            ),
                            label: Text("   اشعارات",textAlign: TextAlign.right,style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.bold),),
                    
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
 
                            side: BorderSide(style: BorderStyle.solid,color:  Color.fromARGB(178, 75, 184, 11)),
                          // shape: OutlinedBorder(),
                              primary: Colors.white,
                          ),
                          onPressed: () {
                               Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => listnotif()),
                            );
                          },
                        ))
        ))]),
                     /*   Column(
                          children: [
                       Container(
                        height: 190,
                        width: 150,
                        margin: const EdgeInsets.all(6),
                              child: ElevatedButton.icon(
 
                         icon: Icon(
                            Icons.info_outlined,
                            color: Colors.black,
                            ),
                            label: Text("  عن التطبيق",textAlign: TextAlign.right,style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.bold,)),
                    
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
 
                            side: BorderSide(style: BorderStyle.solid,color:  Color.fromARGB(178, 75, 184, 11)),
                           primary: Colors.white,
                          ),
                          onPressed: () {
                               Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => home()),
                            );
                          },
                        ),
                     )]
                     ),*/
                             
             
            
    ],)
    
 
          ],
        ),
      ]));
}
}
class HeaderCurvedContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.green;
    Path path = Path()
      ..relativeLineTo(0, 120)
      ..quadraticBezierTo(size.width / 3, 120, size.width, 90)
      ..relativeLineTo(0, -100)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
