
// ignore_for_file: prefer_const_constructors, unnecessary_new, unused_local_variable
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'dart:io';
//import 'package:badges/badges.dart';
//import 'dart:js';
import 'package:async/async.dart';
import 'package:logger/logger.dart';
import 'package:path/path.dart';
//import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
// ignore: unnecessary_import
import 'package:camera/camera.dart';
import 'package:http/http.dart' as http;

import 'package:second/home.dart';

import 'main.dart';
import 'more.dart';
import 'newbadge.dart';
class newComplaint extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //centerTitle: true,
      title: ' ' ,

      theme: ThemeData(
       
        primarySwatch: Colors.blue,
      ),
      home: compPage(),
    );
  }

}


class compPage extends StatefulWidget {
  @override
  _compPageState createState() => _compPageState();
}

class _compPageState extends State<compPage>{

  @override

 late int intt;
  
var pth;

  String dropdownvalue="نوع الشكوى";
   final myController = TextEditingController();
   final myControllerr = TextEditingController();
File? myfile;
   File? image;

 
    getfromcamera() async{
     XFile?  xFile=await ImagePicker().pickImage(
       source: ImageSource.camera,maxHeight: 1080,maxWidth: 1080);
       setState(() {
   
 image= File(xFile!.path);
  

       });

   }
     getfromdevic() async{
     XFile?  xFile=await ImagePicker().pickImage(
       source: ImageSource.gallery,maxHeight: 1080,maxWidth: 1080);
       setState(() {
    
 image= File(xFile!.path);

  
       });

   }
late Position cl;
 Future getPosition() async{
                           
                            bool services ;
                            services=await Geolocator.isLocationServiceEnabled();
                            print(services);

                            LocationPermission per= await Geolocator.checkPermission();
                        
                            if(per==LocationPermission.denied){
                              per= await Geolocator.requestPermission();
                            }
                             if(per==LocationPermission.always){
                             return  await Geolocator.getCurrentPosition().then((value) => value);
                           
                              
                            }
                            
                            //print(per);

                        /*if(services==true)
                        {
                          AwesomeDialog(
                         context: context(),
                          animType: AnimType.SCALE,
                          dialogType: DialogType.INFO,
                          body: Center(child: Text(
                                  'If the body is specified, then title and description will be ignored, this allows to further customize the dialogue.',
                                  style: TextStyle(fontStyle: FontStyle.italic),
                                ),),
                          title: 'This is Ignored',
                          desc:   'This is also Ignored',
                          btnOkOnPress: () {}, context: context(), 
                              ).show();
                                          }*/
                          }

bool _isShow = true;
var valuesel =":نوع الشكوى";
final _formKey = GlobalKey<FormState>();
 bool isvisiable=false;
 int x=0;
  

 // ignore: prefer_final_fields
 var _controller = Completer();
 
 
      final CameraPosition _kGooglePlex = const CameraPosition(
   
    target:  LatLng(32.13259, 35.20326),
    zoom: 15,
  );


  late GoogleMapController gmc;
  Set<Marker> mark={
    Marker(
      visible:true,
      markerId:MarkerId("1"),
      position:LatLng(32.13259, 35.20326),
  )
  };

late String name;
 late int id;
 String resentmes=" ";
 int adminid=0 ;
 int adminidsolve=0 ;
String solvemech=" ";
bool isopen=false;
 late String lat="0";
 late String lng="0";
 late String descrption;
 late String place;
 late String type;












///////////////////////////////////////////////////////////////////////////////////////////////////////////////
/*

 uploadimg (File file,String url) async {
  var request=http.MultipartRequest("POST",Uri.parse(url)) ;
  var lenght= await file.length();
  var streem=http.ByteStream(file.openRead());
   var pathimg=basename(file.path);
  var multipart=http.MultipartFile("FileImage",streem,lenght,filename:basename(file.path)) ;
  request.files.add(multipart);
  var myreq=await request.send();
  var respo=await http.Response.fromStream(myreq);
  //var res = json.parse(respo);
  if (respo.statusCode == 200 || respo.statusCode == 201) {
       
        return JsonDecoder(/*res.body*/) ;
      }
    } */
 var multipartFile;
////////////////////////////////////////////////////////////////////////////////////////////////////////
DateTime now = new DateTime.now();
//final localDay = dDay.toLocal();
  upload(File imageFile,String lat,String lng,String descrption,String place,String type) async {
    print("in upload");
    // open a bytestream
    var stream =new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
    // get file length
    var length = await imageFile.length();

    // string to uri
    var uri = Uri.parse("http://s2p1.gis.najah.edu:8000/upload");

    // create multipart request
    var request = new http.MultipartRequest("POST", uri);

    // multipart that takes file
 multipartFile = new http.MultipartFile('image', stream, length,
        filename: basename(image!.path)
       // complainantsName:hjk,
        );

    // add file to multipart
    request.files.add(multipartFile);

      request.fields['complainantsName']=shared.getString("name").toString();
    request.fields['type']=type ;
    request.fields['place']=place ;
     request.fields['descrption']=descrption ;
 
    request.fields['lat']= lat .toString() ;
    request.fields['lng']=lng.toString();
     request.fields['isOpen']=false .toString() ;
    request.fields['solved']=false.toString();
    request.fields['solvingMechanism']="0".toString();
    request.fields['userID']=shared.getString("id").toString();
    request.fields['resentMessages']="".toString();
    request.fields['adminID']="0".toString();
    request.fields['adminIDsolve']="0".toString();
 request.fields['date']=now.toString();
print(now);

    print("after");

    // send
    var response = await request.send();
  //  print(response.statusCode);

    // listen for response
    response.stream.transform(utf8.decoder).listen((value) {
    // print(value);
  
    });
      //  getpoints();
  }
     Dio dio = new Dio();

  final logger = Logger();




  @override
  Widget build(BuildContext context) {
    return Scaffold(
         appBar: AppBar(
        centerTitle: true,
        title: const Text(" تسجيل شكوى",textDirection: TextDirection.rtl,textAlign: TextAlign.center,style: const TextStyle(color: Colors.white),),
        leading: new IconButton(
                      icon: new Icon(Icons.arrow_back_ios, color: Colors.white),
                      onPressed: () {    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => home()),
                      );}
                    ),
         actions: <Widget>[
                newbadge(
              top: 8,
              right: 8,
              value: "",
  child:  IconButton(
      
      icon: Icon(
        Icons.more,
        color: Colors.white,
      ),
      onPressed: () {
  
           Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => more()),
                      );
        // do something
      },
    ))
  ],
        //leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back)),
       elevation: 10,
      backgroundColor: Colors.green,
      //systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.red),
      ),
 
      body:Container(
        alignment: Alignment.center,

        child: ListView( 
 children: [
   
   

       Container(
         margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
         padding: const EdgeInsets.all(10),
         child:Row(
           mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [

                 Column(
                  children: [
                    IconButton(onPressed: (){
 
                      print("in camera");
                      getfromcamera();
                   

                    }, icon: const Icon(Icons.photo_camera_outlined)),
                   // Icon(Icons.abc_outlined),
                    const Text("التقاط صورة"),


                  ],

                ),

                    Column(
                  children: [
                  IconButton(onPressed: ()async{
                    //print("1112365284");
                   getPosition();
                   cl=await Geolocator.getCurrentPosition().then((value) => value);
                   print("lat ${cl.latitude}");
                             print("long ${cl.longitude}");
                   print("object");
                   String strt=cl.latitude.toString() ;
                   lat=strt;
                   myController.text=strt ;
                    String str=cl.longitude.toString() ;
                    lng=strt;
                   myControllerr.text=str ;
                  }, icon: const Icon(Icons.share_location_outlined)),
                   // Icon(Icons.abc_outlined),
                    const Text("تحديد موقعي"),



                  ],

                ),
                         Column(
                  children: [
                          IconButton(onPressed: (){
                          isvisiable = !isvisiable;

                      setState(() {
 
                      });
                          
                          }, icon: const Icon(Icons.location_on_outlined)),
                   // Icon(Icons.abc_outlined),
                    const Text(" تحديد موقع اخر"),

                  ],

                ),
                             Column(
                  children: [
                          IconButton(onPressed: (){
                            print("from devic");
                           getfromdevic();
                          }, icon: const Icon(Icons.image_outlined)),
                   // Icon(Icons.abc_outlined),
                    const Text(" اضافة صورة"),

                  ],

                ),

              ],

),

                  


                  ),



                  ///////////////////////////////////////////////////////////
                
        
      
    ////////////////////////

                  Visibility(
                     
                    visible:isvisiable,
                    child:Container(height: 200,width: 200,
                    child: GoogleMap(
                      
                    markers: mark,
                          mapType: MapType.normal,
                          initialCameraPosition: _kGooglePlex,
                         onTap: (LatLng){
                                    print("0000000000000000000000000000000000");
                          mark.remove(Marker(markerId: MarkerId("1")));
                          mark.add(Marker(markerId: MarkerId("1"),position: LatLng));
                           print("11111111111111111111111111111111111");
                            print(LatLng.latitude) ;
                             myController.text= LatLng.latitude .toString();
                             lat= LatLng.latitude .toString();
                              lng=LatLng.longitude .toString() ;
                              myControllerr.text=LatLng.longitude .toString() ;
                          setState((){

                            }
                          );
                           String strt=cl.latitude.toString() ;
                   myController.text= LatLng.latitude as String ;
                  
                   print(cl.latitude.toString) ;
                  
                    String str=cl.longitude.toString() ;
                  
                         

                          
                          },
                          onMapCreated: (controller) {
                            _controller.complete(controller);
                          },
                        ),),

                  ),
                      Container(
                      padding: const EdgeInsets.all(20),
                      child: Column(children: [DecoratedBox(
                            decoration: BoxDecoration( 
                              color: Colors.green, //background color of dropdown button
                             // border: Border.all(color: Colors.black, width:3), //border of dropdown button
                              borderRadius: BorderRadius.circular(30), //border raiuds of dropdown button
                           
                            ),
                            
                            child:Padding(
                              padding: const EdgeInsets.only(left:30, right:30),
                              child:DropdownButton(
                                hint: 
                                new Directionality(
                                      textDirection: TextDirection.rtl,
                                      child: const Text(" ",textAlign: TextAlign.right,)),
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
         labelStyle: const TextStyle(color: Colors.black),
                  labelText: " نوع الشكوى ",
                  
                  ),
        )

                                ),
                                    value: "نوع الشكوى",
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
         labelStyle: const TextStyle(color: Colors.black),
                  labelText: " حفر في الشارع ",
                  
                  ),
        ),
                                ),
                                    value: "تعبيد"
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
         labelStyle: const TextStyle(color: Colors.black),
                  labelText: " مطبات ",
                  
                  ),
        )
                                ),
                                    value: "مطبات"
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
         labelStyle: const TextStyle(color: Colors.black),
                  labelText: " تعديات على الارصفة ",
                  
                  ),
        )
                                ),
                                    value: "تجاوزات",
                                  )

                                ],
                                onChanged: (String? newValue){ //get value when changed
                           
                                     setState(() {
                       dropdownvalue = newValue!;
                       type=dropdownvalue;
                    });
                                },
                                icon: const Padding( //Icon at tail, arrow bottom is default icon
                                  padding: const EdgeInsets.only(left:20),
                                  child:const Icon(Icons.arrow_circle_down_sharp)
                                ), 
                                iconEnabledColor: Colors.black, //Icon color
                                style: const TextStyle(  //te
                                  color: Colors.black, //Font color
                                  fontSize: 20 //font size on dropdown button
                                ),
                                
                                dropdownColor: Colors.white, //dropdown background color
                                underline: Container(), //remove underline
                                isExpanded: true, //make true to make width 100%
                              )
                            )
                          )
                                                                      
                                                                      
                                                                        
       
                              ],),

), 

     Container(
       
       padding: const EdgeInsets.all(5),
       // ignore: unnecessary_new
       child: new Directionality(
          
    textDirection: TextDirection.rtl,
    child: TextField(
      enabled: false,
       // style:TextStyle(color: Colors.green) ,
       textAlign: TextAlign.right,
       controller: myController,
       autofocus: false,
       // ignore: unnecessary_new
       decoration: new InputDecoration(
          border: const OutlineInputBorder(
           
                        borderRadius: const BorderRadius.all(const Radius.circular(10.0)),
                      ),
                contentPadding: const EdgeInsets.symmetric(vertical: 10),      
         labelStyle: const TextStyle(color: Colors.black),
                  labelText: " خط العرض  ",
                  
                  ),
            
                  onChanged: (value) {
                             lat  = value ;
                                       }
        )),
     ),





           Container(
              key: _formKey,
             padding: const EdgeInsets.all(5),
             // ignore: unnecessary_new
             child: new Directionality(
        
    textDirection: TextDirection.rtl,
    child: TextField(
      enabled: false,     // style:TextStyle(color: Colors.green) ,
     textAlign: TextAlign.right,
     controller: myControllerr,
    // autofocus: true,
     // ignore: unnecessary_new
     decoration: new InputDecoration(
        border: const OutlineInputBorder(
          gapPadding: 10,
                        borderRadius: const BorderRadius.all(const Radius.circular(10.0)),
                      ),
                      contentPadding: const EdgeInsets.symmetric(vertical: 10),
                     
       labelStyle: const TextStyle(color: Colors.black),
                  labelText: " خط الطول ",
                 
                  ),
                    onChanged: (value) {
                             lng  = value ;
                                       }
      )
      
      ),
           ),
             Container(
          
           padding: const EdgeInsets.all(5),
           // ignore: unnecessary_new
           child: new Directionality(
    textDirection: TextDirection.rtl,
    child: TextField(
     textAlign: TextAlign.right,
     //controller: _textEdittingControler_bookName,
     //autofocus: true,
     decoration: new InputDecoration(
        border: const OutlineInputBorder(
                        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                      ),
                      contentPadding: const EdgeInsets.symmetric(vertical: 10),
       labelStyle: const TextStyle(color: Colors.black),
                  labelText:" اسم المنطقة ",
                  hintText: "اسم المنطقة "
                  ),
                  onChanged: (value) {
                             place  = value ;
                                       }
      )),
         ),

      Container(
        padding: const EdgeInsets.all(5),
        // ignore: unnecessary_new
        child: new Directionality(
          
    textDirection: TextDirection.rtl,
    child: TextField(
     // style:TextStyle(color: Colors.green) ,
     textAlign: TextAlign.right,
     //controller: _textEdittingControler_bookName,
     //autofocus: true,
     // ignore: unnecessary_new
     decoration: new InputDecoration(
          border: const OutlineInputBorder(
           
                        borderRadius: const BorderRadius.all(const Radius.circular(10.0)),
                      ),
                      contentPadding: const EdgeInsets.symmetric(vertical: 50),
         labelStyle: const TextStyle(color: Colors.black),
                  labelText: " ملاحظات اضافية   ",
                  hintText: "اكتب هنا"
                  ),
                   maxLines: 5,  minLines: 1, 
                     onChanged: (value) {
                             descrption  = value ;
                                       }
        )
        ),
      ),





       

                         Padding(
                           
            padding: const EdgeInsets.symmetric(horizontal: 60,vertical: 30),
         
          
            child: ElevatedButton(
              
                 style: ElevatedButton.styleFrom(
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                      ),
                      primary: Color.fromARGB(255, 116, 177, 47),
                    ),
              onPressed: () {
        
                 upload(image!,lat,lng,descrption,place,type);
                // Validate returns true if the form is valid, or false otherwise.
                if (true) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text(' تم الارسال',style: TextStyle(color: Colors.black,)),backgroundColor: Colors.white,
                  ));
                }
                child: const Text('ارسال ',style: TextStyle(color: Colors.black),);
                 Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => newComplaint()),
                  (Route<dynamic> route) => false,
                            );
                    
              },
               child: const Text('ارسال ',style: TextStyle(color: Colors.black),)
            ),
          ),
                                   

              

],
),
  ),
  

);
}

 


}








  






  


