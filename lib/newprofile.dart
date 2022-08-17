// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:second/home.dart';
import 'package:second/main.dart';
import 'package:second/profile.dart';

class newprofile extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
      return MaterialApp(
      //centerTitle: true,
      title: '               تسجيل جديد                     ' ,
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
      ),
      home: myprofile(),
    );
  }
  }




class myprofile extends StatefulWidget{
  @override


  _profState createState() => _profState();

}

class _profState extends State<myprofile> {
     Dio dio = new Dio();
 int i=1;
  final logger = Logger();

  @override
   Widget build(BuildContext context) {
     
    
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.green,
     
      ),
      body: Stack(
        alignment: Alignment.center,
       
              children: [
                  CustomPaint(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
            painter: HeaderCurvedContainer(),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(0),
                child: Text(
                  "الصفحة الشخصية",
                  style: TextStyle(
                    fontSize: 35,
                   // letterSpacing: 1.5,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(0.0),
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.width / 3,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 5),
                  shape: BoxShape.circle,
                  color: Colors.white,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('images/prof.png'),
                  ),
                ),
              ),
            ],
          ),
          Column(
              

            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                 Padding(
                padding: EdgeInsets.all(85),
            
              ),
               
                
              Container(
                
               
               // margin: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                 // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [



                    Container(
     
          child: FutureBuilder(
                 future:getprofile(),
                builder: (BuildContext context,AsyncSnapshot snapshot ){
                     
       if(snapshot.connectionState==ConnectionState.waiting){
                 // ignore: prefer_const_constructors
                 return Text("....تحميل",style: TextStyle(fontSize: 18),textAlign: TextAlign.center,);
               }
               if(snapshot.hasData!=null){

           return  Container(
                width: double.infinity,
                   height: 400,
             child: ListView.builder(
       
                 itemCount: snapshot.data['user'].length,
                    //   shrinkWrap: true,
                  
                       physics: NeverScrollableScrollPhysics(),
               itemBuilder: (context,i){
                    
                    
                 return Container(  width: double.infinity,
                   height: 400,child: Profile(name: "${snapshot.data['user'][i]['fullname']}", lat: double.parse("${snapshot.data['user'][i]['lat']}"), lng:double.parse( "${snapshot.data['user'][i]['long']}"), age: int.parse("${snapshot.data['user'][i]['age']}"), point: int.parse("${snapshot.data['user'][i]['points']}")));
                 
                   // profile(, namecomp: "${snapshot.data['user'][i]['type']}", descr:" ${snapshot.data['user'][i]['resentMessages']}"));
               }
              ),
           ) ;
               }
               
                return Text("....تحميل",style: TextStyle(fontSize: 18),textAlign: TextAlign.center,);
             }),
        ),
                    /*
                    Container(
                      height: 55,
                      width: 200,
                      child: RaisedButton(
                        onPressed: () {
                         Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>home()),
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
                    )*/
                  ],
                ),
              )
            ],
          ),
     
        
        ],
      ),
    );
  }
  getprofile() async{





  String url =("http://s2p1.gis.najah.edu:8000/profile");

   logger.d("url is: $url");
   try {

      Response response = await dio.post(
      url,
      
        data: jsonEncode({
"id":shared.getString("id"),
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