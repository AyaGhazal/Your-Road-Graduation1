import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:logger/logger.dart';
import 'package:second/newprofile.dart';

import 'main.dart';

class editlocation extends StatefulWidget{
  @override
  State<editlocation> createState() => _editlocationState();
}

class _editlocationState extends State<editlocation> {
  late Position cl;
  TextEditingController latController = TextEditingController();
  late double lat;

  late double long;
 Future getPosition() async{
                           
                            bool services ;
                            services=await Geolocator.isLocationServiceEnabled();
                           

                            LocationPermission per= await Geolocator.checkPermission();
                         
                            if(per==LocationPermission.denied){
                              per= await Geolocator.requestPermission();
                            }
                             if(per==LocationPermission.always){
                             return  await Geolocator.getCurrentPosition().then((value) => value);
                          
                              
                            }
 }
       Dio dio = new Dio();

  final logger = Logger();
    updatelocation(double lat,double long) async{


  String url =("http://s2p1.gis.najah.edu:8000/updatelocation");

   logger.d("url is: $url");
   try {

      Response response = await dio.post(
      url,
      
        data: jsonEncode({
"id":shared.getString("id"),
 "lat": lat,
  "long": long,
//shared.getString("id"),
    }),
  
      );
 
           print("1111111111111111111111111");
      if (response.statusCode == 200 || response.statusCode == 201) {
     
 
         logger.d("response is : ${response.data.toString()}");   
  return response.data;
   
        
      } 
  
      
    }on DioError catch (e) {
    
      logger.e("catch error : $e");
    }



}
  @override
  Widget build(BuildContext context) {
   return Scaffold(
             appBar: AppBar(
        centerTitle: true,
        title: const Text(" تعديل موقعي ",textDirection: TextDirection.rtl,textAlign: TextAlign.center,style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),),
        //leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back)),
       elevation: 10,
      backgroundColor: Colors.green,
      //systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.red),
      ),
  body: Column(children: [
        Row(
        
        children: [

                       Container(
                          padding: const EdgeInsets.all(10),
                           width: MediaQuery.of(context).size.width/3,
                         child: ElevatedButton(
                    child: const Text(
                      ' اضغط هنا لتحديد موقعك',
                      style: TextStyle(color: Colors.white,fontSize: 12.2),
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      primary: const Color.fromARGB(200, 11, 88, 24),
                    ),
                 

                     onPressed: ()async{
                  
                   getPosition();
                   cl=await Geolocator.getCurrentPosition().then((value) => value);
                   print("lat ${cl.latitude}");
                             print("long ${cl.longitude}");
                   print("object");
                   lat=cl.latitude;
                   long=cl.longitude;
                   String strt=cl.latitude.toString() ;
                    String str=cl.longitude.toString() ;
                  
                   latController.text= strt+str;
               
                  },
                    
                
                  )),
                  Container(
                     width: MediaQuery.of(context).size.width/1.5,
               padding: const EdgeInsets.all(10),
                child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: TextField(
                    textAlign: TextAlign.right,
                      controller: latController,
                  enabled: false,
                    // ignore: prefer_const_constructors, unnecessary_new
                    decoration: new InputDecoration(
                        border: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                      ),
                      labelStyle: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                                labelText:"موقعي",
                              
                                ),
                                 onChanged: (value) {
                                lat = value as double;
                                       }
                      )),),]
                                  ),
                           Container(
                              margin: const EdgeInsets.all(20),
                      height: 55,
                      width: 200,
                      child: RaisedButton(
                        onPressed: () {
                          updatelocation(lat, long);
                         Navigator.push(
                        context,
                      MaterialPageRoute(builder: (context) =>newprofile()),
                      );
                     setState(() {});
                        },
                        color: Colors.green,
                        child: Center(
                          child: Text(
                            "تعديل",
                            style: TextStyle(
                              fontSize: 23,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    )
  ]),

   );
  }
}