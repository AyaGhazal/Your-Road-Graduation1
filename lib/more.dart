import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:second/database.dart';
import 'package:second/main.dart';
import 'package:second/tempel_more.dart';
import 'package:flutter/src/rendering/object.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';
class more extends StatefulWidget {
  // This widget is the root of your application.
   
  @override
  State<more> createState() => _moreState();
}

class _moreState extends State<more> {

 bool isLoading=false;
 var imag="scaled_35e0e881-0490-4d0f-9acc-370342030c955356633767003382563.jpg";
   Dio dio = new Dio();
 
  final logger = Logger();



  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
                 appBar: AppBar(
        centerTitle: true,
        title: const Text(" شكاوي تم الرد عليها ",textDirection: TextDirection.rtl,textAlign: TextAlign.center,style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),),
        //leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back)),
       elevation: 10,
      backgroundColor: Colors.green,
      //systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.red),
      ),
     body: Container(
       padding: EdgeInsets.all(10),
    height: double.infinity,
    width: double.infinity,
       child: ListView(
        shrinkWrap: true,
           
           // ignore: prefer_const_literals_to_create_immutables
           children: [
 
        Container(
     
          child: FutureBuilder(
                 future:getmores(),
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
                    
                    
                 return  Container(
                    height:100 ,
                     width: double.infinity,
                   child: templer_more(imag: imag, namecomp: "${snapshot.data['user'][i]['type']}", descr:" ${snapshot.data['user'][i]['resentMessages']}"));
               }
              ,
           ) ;
               }
               
                return Text("....لا يوجد شكاوي تم الرد عليها",style: TextStyle(fontSize: 18),textAlign: TextAlign.center,);
             }),
        )
           
           
    //  templer_more(imag: imag, namecomp: "تعبيد", descr: "سيتم الل ينتالاتنمتالبلاتنم  نتالاتنمنتا"),

           

  
    

         ],),
     ),
     )
     
    
    );
  }


getmores() async{





  String url =("http://s2p1.gis.najah.edu:8000/image");

   logger.d("url is: $url");
   try {

      Response response = await dio.post(
      url,
      
        data: jsonEncode({
"userID":shared.getString("id"),
//shared.getString("id"),
    }),
  
      );
 
           print("1111111111111111111111111");
      if (response.statusCode == 200 || response.statusCode == 201) {
     
 

   
        
      } 
           logger.d("response is : ${response.data.toString()}");   
  return response.data;
      
    }on DioError catch (e) {
    
      logger.e("catch error : $e");
    }



}
}