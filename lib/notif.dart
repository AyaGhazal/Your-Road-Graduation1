import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class notif extends StatefulWidget {
  
  final String date;

  notif({Key? key,required this. lat,required this. lng,required this.noticeTitle,required this.descrip,required this.date}) : super(key: key);
 final double lat;

  final double lng;

  final String noticeTitle;

  final String descrip;

  @override
  State<notif> createState() => _notifState();
}

class _notifState extends State<notif> {
 var l=22.5214;

var _controller = Completer();

      final CameraPosition _kGooglePlex = const CameraPosition(
  
  target:  LatLng(32.13259, 35.20326),
    zoom: 15,
  );

    late GoogleMapController gmc;

  Set<Marker> mark={
    Marker(
      visible:true,
      markerId:const MarkerId("1"),
      position:LatLng(32.13259, 35.20326),
  ),
 
  };

  @override
  Widget build(BuildContext context) {
    
    
    return SafeArea(
        child: Scaffold(
                   appBar: AppBar(
        centerTitle: true,
        title: const Text(" اشعار جديد",textDirection: TextDirection.rtl,textAlign: TextAlign.center,style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),),
        //leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back)),
       elevation: 10,
      backgroundColor: Colors.green,
      //systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.red),
      ),
        
     body:ListView(children: [
   
     
       Container(
         
       child:   Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
    

          Expanded(flex: 2,
            child: ListTile(title: Text("${widget.noticeTitle}",textAlign: TextAlign.center,style: TextStyle(fontSize: 20),),
            //subtitle:Text("تم حل الشكوى التي قمت بتقديمها، أسعدنا تواصلك معنا نحن بالخدمة",textAlign: TextAlign.center ,) ,)
         ) ),
        
        ],
      ),
    )),
    
     
       Container(
         height: 200,
         width: 200,
         
       child:   Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
     Container(
       height: 200,
       width: 150,
        child: ListTile(title: Text(" الوصف :"+"  ${widget.descrip}",textAlign: TextAlign.right,),
            //subtitle:Text("تم حل الشكوى التي قمت بتقديمها، أسعدنا تواصلك معنا نحن بالخدمة",textAlign: TextAlign.center ,) ,)
         )
     ),
      Container(
       height: 200,
       width: 150,
        child: ListTile(title: Text(":تاريخ الحدث",textAlign: TextAlign.right,style:TextStyle(fontSize:16)),
            subtitle:Text("${widget.date}",textAlign: TextAlign.right ,) ,)
         
     )
        
        ],
      ),
    )),
    Container(height: 200,width: 200,
                    child: GoogleMap(
                      
                    markers: mark,
                          mapType: MapType.normal,
                          initialCameraPosition: _kGooglePlex,
                        
                          onMapCreated: (controller) {
                           // position:LatLng(widget.lat, widget.lng);
                            _controller.complete(controller);
                            mark.remove(Marker(markerId: MarkerId("1")));
                            mark.add(Marker(markerId:  MarkerId("1"),position: LatLng(widget.lat, widget.lng)));
                          },
                          ),


  
                           
                  
                   
                         

                          
                          
                         
                        ),
    

     ])
     
    
    ));
  }
}