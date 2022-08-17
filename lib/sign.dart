// ignore_for_file: unnecessary_new

import 'dart:convert';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:second/StartPage.dart';
import 'LogIn.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';
import 'package:geolocator/geolocator.dart';


class signup extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //centerTitle: true,
     title: "signup",
           home: newsign(),
 );
 

    
  }

}
class newsign extends StatefulWidget {
  @override
  _sign createState() => _sign();
}







class _sign extends State<newsign> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController latController = TextEditingController();
 TextEditingController passwordController1 = TextEditingController();
  String dropdownvalue="الجنس";
  String dropdownvalue1="هل تعاني من اي اعاقة؟";
 late var  id;
 late var  email;
  // ignore: prefer_typing_uninitialized_variables
  late var  name;
  late var  age;
  late var  password;
  late var  gender;
  late var  lat;
  late var  long;
   var  points=0;
late var flage;
   Dio dio = new Dio();
 
  final logger = Logger();

late Position cl;
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



bool isLoading =false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:isLoading ==true?Center(child: CircularProgressIndicator())
         :Stack(children: <Widget>[
      Container(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
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
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.all(8),
        alignment: Alignment.center,
        // color: Color.fromARGB(255, 134, 156, 147),
        child: ListView(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(40),
                  child: const Text(
                    
                    ' انشاء حساب جديد',

                    style: TextStyle(fontSize: 30,color: Colors.white),
                  )),
                      Container(
                padding: const EdgeInsets.all(10),
                child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: TextField(
                         keyboardType: TextInputType.number,
                    textAlign: TextAlign.right,
                      controller: idController,
                    //controller: _textEdittingControler_bookName,
                   // obscureText: true,
                    // ignore: prefer_const_constructors, unnecessary_new
                    decoration: new InputDecoration(
                    
                        border: const OutlineInputBorder(
                                        borderRadius: const BorderRadius.all(const Radius.circular(10.0)),
                                      ),
                      labelStyle: const TextStyle(color: Colors.white),
                                labelText:"رقم الهوية",
                              
                                ),
                                onChanged: (value) {
                                id = value;
                                       }
                      )),
                                  ),
                                      Container(
                padding: const EdgeInsets.all(10),
                child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: TextField(
                    textAlign: TextAlign.right,
                      controller: nameController,
                    //controller: _textEdittingControler_bookName,
                    //obscureText: true,
                    // ignore: prefer_const_constructors, unnecessary_new
                    decoration: new InputDecoration(
                        border: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                      ),
                      labelStyle: const TextStyle(color: Colors.white),
                                labelText:"الاسم الكامل",
                              
                                ),
                                 onChanged: (value) {
                                name = value;
                                       }
                      )),
                                  ),
                                      Container(
                padding: const EdgeInsets.all(10),
                child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: TextField(
                    textAlign: TextAlign.right,
                      controller: emailController,
                  
                    // ignore: prefer_const_constructors, unnecessary_new
                    decoration: new InputDecoration(
                        border: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                      ),
                      labelStyle: const TextStyle(color: Colors.white),
                                labelText:"البريد الالكتروني",
                              
                                ),
                                 onChanged: (value) {
                                email = value;
                                       }
                      )),
                                  ),
                                      Container(
                padding: const EdgeInsets.all(10),
                child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: TextField(
                    textAlign: TextAlign.right,
                      controller: ageController,
              
                 keyboardType: TextInputType.number,
                    // ignore: prefer_const_constructors, unnecessary_new
                    decoration: new InputDecoration(
                        border: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                      ),
                      labelStyle: const TextStyle(color: Colors.white),
                                labelText:"العمر",
                              
                                ),
                                 onChanged: (value) {
                                age = value;
                                       }
                      )),
                                  ),
                                            Container(
                                              
                     padding: const EdgeInsets.all(10),
                      child: Column(children: [DecoratedBox(
                            decoration: BoxDecoration( 
                              //color:const Color.fromARGB(255, 116, 177, 47), //background color of dropdown button
                             border: Border.all(color: Colors.black38, width:1), //border of dropdown button
                              borderRadius: BorderRadius.circular(10), //border raiuds of dropdown button
                              
                            ),
                            
                           
                              child:DropdownButton(
                                
                                hint: 
                                // ignore: prefer_const_constructors
                                new Directionality(
                                      textDirection: TextDirection.rtl,
                                      child: const Text("",textAlign: TextAlign.right,style: TextStyle(color: Colors.white),)),
            //Text(": نوع الشكوى ",textDirection: TextDirection.rtl,textAlign: TextAlign.right,),
                               value: dropdownvalue,
                                // ignore: prefer_const_literals_to_create_immutables
                                items: [ //add items in the dropdown 
                                  // ignore: prefer_const_constructors
                                      DropdownMenuItem(
                                  child: new Directionality(
          
                            textDirection: TextDirection.rtl,
                                child: TextField(
                                enabled: false,
                              
                                textAlign: TextAlign.right,
                            
                                autofocus: false,
                                // ignore: unnecessary_new
                                decoration: new InputDecoration(
                                
                                        // contentPadding: const EdgeInsets.symmetric(vertical: 10),      
                                  labelStyle: const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                                            labelText: "الجنس",
                                            
                                            ),
                                  ),
                              ),
                                  value: "الجنس"
                                      ), 
                                   DropdownMenuItem(
                                  child: new Directionality(
          
                            textDirection: TextDirection.rtl,
                                child: TextField(
                                enabled: false,
                              
                                textAlign: TextAlign.right,
                            
                                autofocus: false,
                                // ignore: unnecessary_new
                                decoration: new InputDecoration(
                                
                                        // contentPadding: const EdgeInsets.symmetric(vertical: 10),      
                                  labelStyle: const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                                            labelText: "ذكر",
                                            
                                            ),
                                  ),
                              ),
                                  value: "male"
                                      ), 
                                       DropdownMenuItem(
                                  child: new Directionality(
          
                            textDirection: TextDirection.rtl,
                                child: TextField(
                                enabled: false,
                              
                                textAlign: TextAlign.right,
                            
                                autofocus: false,
                                // ignore: unnecessary_new
                                decoration: new InputDecoration(
                                
                                        // contentPadding: const EdgeInsets.symmetric(vertical: 10),      
                                  labelStyle: const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                                            labelText: "انثى",
                                            
                                            ),
                                  ),
                              ),
                                  value: "female"
                                      ),
                                  

                                ],
                   
                    onChanged: (String? newValue){ //get value when changed
                           
                                     setState(() {
                       dropdownvalue = newValue!;
                        gender= newValue;
                    });
                                },
                                icon: const Padding( //Icon at tail, arrow bottom is default icon
                                  padding: const EdgeInsets.all(10),
                                  child:const Icon(Icons.arrow_circle_down_sharp)
                                ), 
                                iconEnabledColor: Colors.white, //Icon color
                                style: const TextStyle(  //te
                                  color: Color.fromARGB(255, 0, 0, 0), //Font color
                                  fontSize: 20 //font size on dropdown button
                                ),
                                
                                dropdownColor: Colors.green, //dropdown background color
                                underline: Container(), //remove underline
                                isExpanded: true,  
                              )
                            
                          )
                                                                      
                                                                      
                                                                        
       
                      ]),

),
                          Container(
                                              
                     padding: const EdgeInsets.all(10),
                      child: Column(children: [DecoratedBox(
                            decoration: BoxDecoration( 
                              //color:const Color.fromARGB(255, 116, 177, 47), //background color of dropdown button
                             border: Border.all(color: Colors.black38, width:1), //border of dropdown button
                              borderRadius: BorderRadius.circular(10), //border raiuds of dropdown button
                              
                            ),
                            
                           
                              child:DropdownButton(
                                
                                hint: 
                                // ignore: prefer_const_constructors
                                new Directionality(
                                      textDirection: TextDirection.rtl,
                                      child: const Text("",textAlign: TextAlign.right,style: TextStyle(color: Colors.white),)),
            //Text(": نوع الشكوى ",textDirection: TextDirection.rtl,textAlign: TextAlign.right,),
                              value: dropdownvalue1,
                                // ignore: prefer_const_literals_to_create_immutables
                                items: [ //add items in the dropdown 
                                  // ignore: prefer_const_constructors
                                     DropdownMenuItem(
                                  child: new Directionality(
          
                            textDirection: TextDirection.rtl,
                                child: TextField(
                                enabled: false,
                              
                                textAlign: TextAlign.right,
                            
                                autofocus: false,
                                // ignore: unnecessary_new
                                decoration: new InputDecoration(
                                
                                        // contentPadding: const EdgeInsets.symmetric(vertical: 10),      
                                  labelStyle: const TextStyle(color: Colors.white),
                                            labelText: "هل تعاني من اي اعاقة؟",
                                            
                                            ),
                                  ),
                              ),
                                  value: "هل تعاني من اي اعاقة؟"
                                      ), 
                                       DropdownMenuItem(
                                  child: new Directionality(
          
                            textDirection: TextDirection.rtl,
                                child: TextField(
                                enabled: false,
                              
                                textAlign: TextAlign.right,
                            
                                autofocus: false,
                                // ignore: unnecessary_new
                                decoration: new InputDecoration(
                                
                                        // contentPadding: const EdgeInsets.symmetric(vertical: 10),      
                                  labelStyle: const TextStyle(color: Colors.white),
                                            labelText: "اجل",
                                            
                                            ),
                                  ),
                              ),
                                  value: "true"
                                      ), 
                                      DropdownMenuItem(
                                  child: new Directionality(
          
                            textDirection: TextDirection.rtl,
                                child: TextField(
                                enabled: false,
                              
                                textAlign: TextAlign.right,
                            
                                autofocus: false,
                                // ignore: unnecessary_new
                                decoration: new InputDecoration(
                                
                                        // contentPadding: const EdgeInsets.symmetric(vertical: 10),      
                                 labelStyle: const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                                            labelText: "لا",
                                            
                                            ),
                                  ),
                              ),
                                  value: "false"
                                      ),
                                  

                                ],
                       onChanged: (String? newValue){ //get value when changed
                           
                                     setState(() {
                       dropdownvalue1 = newValue!;
                        flage= newValue;
                    });
                                },
                                icon: const Padding( //Icon at tail, arrow bottom is default icon
                                  padding: const EdgeInsets.all(10),
                                  child:const Icon(Icons.arrow_circle_down_sharp)
                                ), 
                                iconEnabledColor: Colors.white, //Icon color
                                style: const TextStyle(  //te
                                  color: Colors.white, //Font color
                                  fontSize: 20 //font size on dropdown button
                                ),
                                
                                dropdownColor: Colors.green, //dropdown background color
                                underline: Container(), //remove underline
                                isExpanded: true,  
                              )
                            
                          )
                                                                      
                                                                      
                                                                        
       
                      ]),

),
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
                                     width: MediaQuery.of(context).size.width/2,
               // padding: const EdgeInsets.all(10),
                child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: TextField(
                    textAlign: TextAlign.right,
                      controller: latController,
                  
                    // ignore: prefer_const_constructors, unnecessary_new
                    decoration: new InputDecoration(
                        border: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                      ),
                      labelStyle: const TextStyle(color: Colors.white),
                                labelText:"موقعي",
                              
                                ),
                                 onChanged: (value) {
                                lat = value;
                                       }
                      )),),]
                                  ),
                                      Container(
                                        
                padding: const EdgeInsets.all(10),
                child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: TextField(
                    textAlign: TextAlign.right,
                      controller:passwordController,
                    //controller: _textEdittingControler_bookName,
                    obscureText: true,
                    // ignore: prefer_const_constructors, unnecessary_new
                    decoration: new InputDecoration(
                        border: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(const Radius.circular(10.0)),
                                      ),
                      labelStyle: const TextStyle(color: Colors.white),
                                labelText:"كلمة السر ",
                              
                                ),
                                 onChanged: (value) {
                                password = value;
                                       }
                      )),
                                  ),
                                    
             
              Container(
                  height: 70,
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  child: ElevatedButton(
                    child: const Text(
                      'انشاء حساب',
                      style: TextStyle(color: Colors.white,fontSize: 20),
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      primary: const Color.fromARGB(200, 11, 88, 24),
                    ),
                    onPressed: () {
                      getid(id);
                     
                  
                      print(nameController.text);
                      print(passwordController.text);
                    },
                  )),
              Row(
                children: <Widget>[
                  TextButton(
                    child: const Text(
                      'تسجيل الدخول',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black),
                    ),
                    onPressed: () {
                      
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LogIn()),
                      );
                    },
                  ),
                  const Text('لديك حساب؟',style: TextStyle(color: Colors.white),),
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ]),
      ),
    ]));
  }
  getid(id ) async {
     String url =("http://s2p1.gis.najah.edu:8000/getcount");
   logger.d("url is: $url");
   try {
    
      Response response = await dio.post(
      url,
      
        data: jsonEncode({

  
  "id": id,
 


    }),
  
      );
        
      if ("${response.data}"!=null) {
         
       
        logger.d("response is : ${response.data.toString()}");
        signup(name,email,id,gender,password,age,lat,long,flage);
     
      }
       Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => StartPage()),
                      );
    }on DioError catch (e) {
      logger.e("catch error : $e");
    }


  }

signup(name, email,id, gender, password, age,lat,long,flage) async {


print(name);
print(email);
print(id);
print(gender);
print(password);
print(age);
print(lat);
print(long);
print(points);
  String url =("http://s2p1.gis.najah.edu:8000/signuser/signuser");
   logger.d("url is: $url");
   try {
     isLoading=true;
      setState(() {
          
        });
      Response response = await dio.post(
      url,
      
        data: jsonEncode({

  "fullname": name,
  "id": id,
  "email": email,
  "password": password,
  "gender": gender,
  "lat": lat,
  "long": long,
  "age": age,
  "points": points,
  "specialneeds":flage,


    }),
  
      );
        isLoading=false;
        setState(() {
          
        });
      if (response.statusCode == 200 || response.statusCode == 201) {
            Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => LogIn()),
                        (route)=>false,
                      );
        logger.d("response is : ${response.data.toString()}");
        return response;
      }
       else{
        AwesomeDialog(context: context,
        title:"حدث خطأ" ,
        body: Text(
        "يرجى التأكد من جميع البيانات المدخلة "
        ));
      }
    }on DioError catch (e) {
      logger.e("catch error : $e");
    }
 //  "localhost:8000/signuser/signuser"; 
var count=0;
/*  final http.Response response = await http.post(
    url,
   headers:{
      'Content-Type': 'web/json; charset=UTF-8',
    },
    body: jsonEncode({

  "fullname": "gggg",
 " id": "33232152456",
  "email": "fvghjbv",
  "password": "nbvbn",
  "gender": "jhbvbn",
  "lat": 123212,
  "long": 45.0,
  "age": 12,
  "points": 0,


    }),
  );*/
  //print(response.body);
  // if (response.statusCode == 201) {
  // } else {
  //   throw Exception('Failed to create album.');
  // }
}}
