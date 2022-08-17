import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

import 'main.dart';

class rate extends StatelessWidget{
  Widget build(BuildContext context) {
return MaterialApp(
  home: Scaffold(
       appBar: AppBar(
        centerTitle: true,
        title: const Text("  تقييم التطبيق ",textDirection: TextDirection.rtl,textAlign: TextAlign.center,style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),),
        //leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back)),
       elevation: 10,
      backgroundColor: Colors.green,
      //systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.red),
      ),
      body: Center(
        child: RatingBar()
        )
      )
    );
}
}

class RatingBar extends StatefulWidget {

RatingBarWidget createState() => RatingBarWidget();

}

class RatingBarWidget extends State {

double rating = 3 ;
@override
 Dio dio = new Dio();

  final logger = Logger();

    updaterate(double rating) async{


  String url =("http://s2p1.gis.najah.edu:8000/updaterate");

   logger.d("url is: $url");
   try {

      Response response = await dio.post(
      url,
      
        data: jsonEncode({
"id":shared.getString("id"),
"rate":rating,
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

Widget build(BuildContext context) {
return Scaffold(
  body: SingleChildScrollView(
    child: Center(
    child: Column(
      children: <Widget>[

        Padding(
          padding: const EdgeInsets.all(30.0),
          child: Text('', 
                  style: TextStyle(fontSize: 22))),

        SmoothStarRating(
          allowHalfRating: false,
          onRatingChanged: (value) {
            setState(() {
              rating = value ;
              updaterate(rating);
            });
          },
          starCount: 5,
          rating: rating,
          size: 50.0,
          color: Colors.green,
          borderColor: Colors.green,
          spacing:0.0,           
        ),

        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text('التقييم = '+'$rating', 
                  style: TextStyle(fontSize: 22))),

      ],
    ),
  )));
}
}
  
