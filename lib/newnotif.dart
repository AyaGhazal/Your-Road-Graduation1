import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:second/notif.dart';

class newnotif extends StatelessWidget {
  final String date;

  final String descrip;

final double  lat;

  final double lng;

  final String noticeTitle;

  const newnotif({Key? key,required this. lat,required this. lng,required this.noticeTitle,required this.descrip,required this.date}) : super(key: key);




  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
    
     body:
   
     
   Container(
     height: 100,
     width: double.infinity,
     child:
  Card(
    
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(flex: 2,
            child: Image.asset("Assets/notif.jpeg",width: 100,height: 100,fit: BoxFit.fill,)
            

          ),

          Expanded(flex: 2,
            child: ListTile(title: Text("$noticeTitle",textAlign: TextAlign.center,style: TextStyle(fontSize: 20),),
            //subtitle:Text("تم حل الشكوى التي قمت بتقديمها، أسعدنا تواصلك معنا نحن بالخدمة",textAlign: TextAlign.center ,) ,)
         ) ),
          Expanded(flex: 2,
            child:   IconButton(onPressed: (){
                  Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  notif(lat: lat, lng: lng, noticeTitle: noticeTitle, descrip: descrip, date: date)),
                      );
                   
                 
                  }, icon: const Icon(Icons.preview)),
           
         ) ]),
        
      ) )
      
    ),
    
    
    

    )
     
    
    ;
  }
}