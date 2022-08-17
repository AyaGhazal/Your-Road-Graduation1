import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:second/database.dart';
import 'package:second/main.dart';
import 'package:second/newnotif.dart';
import 'package:second/notif.dart';
import 'package:second/tempel_more.dart';
import 'package:flutter/src/rendering/object.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';
class listnotif extends StatefulWidget {
  // This widget is the root of your application.
   
  @override
  State<listnotif> createState() => _listnotifState();
}

// ignore: camel_case_types
class _listnotifState extends State<listnotif>  {

 bool isLoading=false;
 var imag="noif.jpeg";
   Dio dio = new Dio();
 
  final logger = Logger();



  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
                 appBar: AppBar(
        centerTitle: true,
        title: const Text(" الاشعارات",textDirection: TextDirection.rtl,textAlign: TextAlign.center,style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),),
        //leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back)),
       elevation: 10,
      backgroundColor: Colors.green,
      //systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.red),
      ),
     body: Container(
       padding: EdgeInsets.all(10),
   
       child: ListView(
        shrinkWrap: true,
           
           // ignore: prefer_const_literals_to_create_immutables
           children: [
 
        Container(
     
          child: FutureBuilder(
                 future:getnotif(),
                builder: (BuildContext context,AsyncSnapshot snapshot ){
                     
       if(snapshot.connectionState==ConnectionState.waiting){
                 // ignore: prefer_const_constructors
                 return Text("....تحميل",style: TextStyle(fontSize: 18),textAlign: TextAlign.center,);
               }
               if(snapshot.hasData!=null){

           return  ListView.builder(
       
                 itemCount: snapshot.data['user'].length,
                                       shrinkWrap: true,
                  
                      physics: NeverScrollableScrollPhysics(),
                      
               itemBuilder: (context,i){
                   // return Text("....لا يوجد اشعارات   ",style: TextStyle(fontSize: 18),textAlign: TextAlign.center,);
                   return Container(
                     height:100 ,
                     width: double.infinity,
                     
               child:
                   newnotif(lat:double.parse( "${snapshot.data['user'][i]['lat']}"), 
                  lng: double.parse( "${snapshot.data['user'][i]['lng']}"), noticeTitle: "${snapshot.data['user'][i]['noticeTitle']}",
                    descrip: "${snapshot.data['user'][i]['descriptionNotice']}",
                     date: "${snapshot.data['user'][i]['eventDate']}",));
                  
               }
              ,
           ) ;
               };
               
                return Text("....لا يوجد اشعارات   ",style: TextStyle(fontSize: 18),textAlign: TextAlign.center,);
             }),
        )
           
           
    

           

  
    

         ],),
     ),
     )
     
    
    );
  }


getnotif() async{





  String url =("http://s2p1.gis.najah.edu:8000/getnotif");

   logger.d("url is: $url");
   try {

      Response response = await dio.post(
      url,
      
        data: jsonEncode({
"id":shared.getString("id"),
    }),
  
      );
 
         
      if (response.statusCode == 200 || response.statusCode == 201) {
     
            logger.d("response is : ${response.data.toString()}");   
  return response.data;

   
        
      } 

      
    }on DioError catch (e) {
    
      logger.e("catch error : $e");
    }



}
}