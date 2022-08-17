import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:second/newprofile.dart';

import 'main.dart';

class editname extends StatefulWidget{
  @override
  State<editname> createState() => _editnameState();
}

class _editnameState extends State<editname> {
  @override
  late String name;
       Dio dio = new Dio();

  final logger = Logger();
    updatename(String name) async{


  String url =("http://s2p1.gis.najah.edu:8000/updatename");

   logger.d("url is: $url");
   try {

      Response response = await dio.post(
      url,
      
        data: jsonEncode({
"id":shared.getString("id"),
"fullname":name,
//shared.getString("id"),
    }),
  
      );
 
           print("1111111111111111111111111");
      if (response.statusCode == 200 || response.statusCode == 201) {
     
 
         logger.d("response is : ${response.data.toString()}"); 
          var s="${response.data['id']}";
           print(s);
           print("000000000");
  return response.data;
   
        
      } 
  
      
    }on DioError catch (e) {
    
      logger.e("catch error : $e");
    }



}
  Widget build(BuildContext context) {
   return Scaffold(
             appBar: AppBar(
        centerTitle: true,
        title: const Text(" تعديل الاسم ",textDirection: TextDirection.rtl,textAlign: TextAlign.center,style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),),
        //leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back)),
       elevation: 10,
      backgroundColor: Colors.green,
      //systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.red),
      ),
  body: Column(children: [
         Container(
                    padding: const EdgeInsets.all(20),
                    child: Directionality(
            textDirection: TextDirection.rtl,
            child: TextField(
            textAlign: TextAlign.right,
      enabled:true,
            //controller: _textEdittingControler_bookName,
           
            // ignore: prefer_const_constructors, unnecessary_new
            decoration: new InputDecoration(
                border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                              ),
              labelStyle: TextStyle(color: Colors.black),
                                 labelText:"الاسم : ",
                    
                      
                        ),
                         onChanged: (value) {
                                name = value;
                                       }
              )),
                          ),
                           Container(
                              margin: const EdgeInsets.all(20),
                      height: 55,
                      width: 200,
                      child: RaisedButton(
                        onPressed: () {
                      updatename(name);
                       Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => newprofile()),
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