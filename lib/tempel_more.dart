import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class templer_more extends StatelessWidget{


  const templer_more({Key? key, required this.imag,required this.namecomp,required this.descr}) : super(key: key) ;
  final String descr;

  final String imag;

  final String namecomp;

 Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
  
     body:      
   Container(
     height: 100,
     width: double.infinity,
     child:Card(
       
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           Expanded(flex: 1,
            child: Image.asset("mynode/uploads/"+"$imag",width: 100,height: 100,fit: BoxFit.fill,)
            

),
          Expanded(flex: 2,
            child: ListTile(title: Text("نوع الشكوى : "+"$namecomp",textAlign: TextAlign.right,style:TextStyle(fontSize:16)),
            subtitle:Text("$descr",textAlign: TextAlign.center ,) ,)
          ),
        
        ],
      ),
    ))),
    

     
     
    
    );
  }
}