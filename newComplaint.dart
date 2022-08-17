
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
//import 'dart:js';

//import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
// ignore: unnecessary_import
import 'package:camera/camera.dart';
import 'package:second/complaint.dart';
class newComplaint extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //centerTitle: true,
      title: '               تسجيل جديد                     ' ,
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
  



   final myController = TextEditingController();
   final myControllerr = TextEditingController();

   File? imageFile;
   void getfromcamera() async{
     XFile ? PickedFile=await ImagePicker().pickImage(
       source: ImageSource.camera,maxHeight: 1080,maxWidth: 1080);
       setState(() {
         imageFile = PickedFile as File?;

       });

   }
    void getfromdevic() async{
     XFile ? PickedFile=await ImagePicker().pickImage(
       source: ImageSource.gallery,maxHeight: 1080,maxWidth: 1080);
       setState(() {
         imageFile = PickedFile as File?;

       });

   }
late Position cl;
 Future getPosition() async{
                           
                            bool services ;
                            services=await Geolocator.isLocationServiceEnabled();
                            print(services);

                            LocationPermission per= await Geolocator.checkPermission();
                             print("lkjhjk");
                            if(per==LocationPermission.denied){
                              per= await Geolocator.requestPermission();
                            }
                             if(per==LocationPermission.always){
                             return  await Geolocator.getCurrentPosition().then((value) => value);
                             print("lat ${cl.latitude}");
                             print("long ${cl.longitude}");
                              
                            }
                            
                            print(per);

                         /*  if(services==true){
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
         appBar: AppBar(
        centerTitle: true,
        title: const Text(" تسجيل شكوى",textDirection: TextDirection.rtl,textAlign: TextAlign.center,style: const TextStyle(color: Colors.white),),
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
                   myController.text=strt ;
                    String str=cl.longitude.toString() ;
                   myControllerr.text=str ;
                  }, icon: const Icon(Icons.share_location_outlined)),
                   // Icon(Icons.abc_outlined),
                    const Text("تحديد موقعي"),



                  ],

                ),
                         Column(
                  children: [
                          IconButton(onPressed: (){
                           x=1;
                          
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
                     
                    //visible:isvisiable,
                    child:Container(height: 200,width: 200,
                    child: GoogleMap(
                    
                          mapType: MapType.hybrid,
                          initialCameraPosition: _kGooglePlex,
                          onMapCreated: (controller) {
                            _controller.complete(controller);
                          },
                        ),),

                  ),
                      Container(
                      padding: const EdgeInsets.all(20),
                      child: Column(children: [DecoratedBox(
                            decoration: BoxDecoration( 
                              color:const Color.fromARGB(255, 116, 177, 47), //background color of dropdown button
                              border: Border.all(color: Colors.white, width:3), //border of dropdown button
                              borderRadius: BorderRadius.circular(30), //border raiuds of dropdown button
                           
                            ),
                            
                            child:Padding(
                              padding: const EdgeInsets.only(left:30, right:30),
                              child:DropdownButton(
                                hint: 
                                new Directionality(
                                      textDirection: TextDirection.rtl,
                                      child: const Text("نوع الشكوى :                                 ",textAlign: TextAlign.right,)),
            //Text(": نوع الشكوى ",textDirection: TextDirection.rtl,textAlign: TextAlign.right,),
                               //value: "hh ",
                                // ignore: prefer_const_literals_to_create_immutables
                                items: [ //add items in the dropdown 
                                  // ignore: prefer_const_constructors
                                  DropdownMenuItem(
                                    child: const Text("مطبات "),
                                    value: "1",
                                  ), 
                                  const DropdownMenuItem(
                                    child: const Text("تعديات على الارصفة"),
                                    value: "2"
                                  ),
                                  const DropdownMenuItem(
                                    child: Text("حفر في الشارع"),
                                    value: "3",
                                  )

                                ],
                                onChanged: ( value){ //get value when changed
                            // value = valu;
                                     setState(() {
                     // valuesel = value;
                    });
                                },
                                icon: const Padding( //Icon at tail, arrow bottom is default icon
                                  padding: const EdgeInsets.only(left:20),
                                  child:const Icon(Icons.arrow_circle_down_sharp)
                                ), 
                                iconEnabledColor: Colors.white, //Icon color
                                style: const TextStyle(  //te
                                  color: Colors.white, //Font color
                                  fontSize: 20 //font size on dropdown button
                                ),
                                
                                dropdownColor: Colors.grey, //dropdown background color
                                underline: Container(), //remove underline
                                isExpanded: true, //make true to make width 100%
                              )
                            )
                          )
                                                                      
                                                                      
                                                                        
       
                              ],),

), 

     Container(
       
       padding: const EdgeInsets.all(5),
       child: new Directionality(
          
    textDirection: TextDirection.rtl,
    child: TextField(
      enabled: false,
       // style:TextStyle(color: Colors.green) ,
       textAlign: TextAlign.right,
       controller: myController,
       autofocus: false,
       decoration: new InputDecoration(
          border: const OutlineInputBorder(
           
                        borderRadius: const BorderRadius.all(const Radius.circular(10.0)),
                      ),
                contentPadding: const EdgeInsets.symmetric(vertical: 10),      
         labelStyle: const TextStyle(color: Colors.black),
                  labelText: " خط العرض  ",
                  
                  ),
        )),
     ),





           Container(
              key: _formKey,
             padding: const EdgeInsets.all(5),
             child: new Directionality(
        
    textDirection: TextDirection.rtl,
    child: TextField(
      enabled: false,     // style:TextStyle(color: Colors.green) ,
     textAlign: TextAlign.right,
     controller: myControllerr,
    // autofocus: true,
     decoration: new InputDecoration(
        border: const OutlineInputBorder(
          gapPadding: 10,
                        borderRadius: const BorderRadius.all(const Radius.circular(10.0)),
                      ),
                      contentPadding: const EdgeInsets.symmetric(vertical: 10),
                     
       labelStyle: const TextStyle(color: Colors.black),
                  labelText: " خط الطول ",
                 
                  ),
      )),
           ),

      Container(
        padding: const EdgeInsets.all(5),
        child: new Directionality(
          
    textDirection: TextDirection.rtl,
    child: TextField(
     // style:TextStyle(color: Colors.green) ,
     textAlign: TextAlign.right,
     //controller: _textEdittingControler_bookName,
     //autofocus: true,
     decoration: new InputDecoration(
          border: const OutlineInputBorder(
           
                        borderRadius: const BorderRadius.all(const Radius.circular(10.0)),
                      ),
                      contentPadding: const EdgeInsets.symmetric(vertical: 50),
         labelStyle: const TextStyle(color: Colors.black),
                  labelText: " ملاحظات اضافية  ",
                  hintText: "اكتب هنا"
                  ),
                   maxLines: 5,  minLines: 1, 
        )
        ),
      ),





         Container(
          
           padding: const EdgeInsets.all(5),
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
                  labelText:" معلومات الاتصال ",
                  hintText: "الاسم "
                  ),
      )),
         ),

                         Padding(
                           
            padding: const EdgeInsets.symmetric(horizontal: 80,vertical: 30),
         
          
            child: ElevatedButton(
              
                 style: ElevatedButton.styleFrom(
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                      ),
                      primary: Color.fromARGB(255, 116, 177, 47),
                    ),
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (true) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text(' تم الارسال',style: TextStyle(color: Colors.black,)),backgroundColor: Colors.grey,
                  ));
                }
                   Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => complaint()),
                      );
                      setState(() {});
              },
              child: const Text('ارسال '),
            ),
          ),
                                   

              

],
),
  ),

);
}
 visibale() {

  isvisiable=!isvisiable;
}



  






  
}

