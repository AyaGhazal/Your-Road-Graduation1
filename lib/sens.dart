
// ignore_for_file: import_of_legacy_library_into_null_safe

import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:logger/logger.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sensors/sensors.dart';
import 'package:syncfusion_flutter_charts/charts.dart'as charts;
import 'dart:async';
import 'dart:math' as math;

import 'package:syncfusion_flutter_xlsio/xlsio.dart';

import 'main.dart';

class sens extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
 
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<LiveData> chartData;
  late charts.ChartSeriesController _chartSeriesController;
var count = Random().nextInt(10000000);
   int  x1 = 0;
     int   y1 = 0;
      int  z1 = 0;
    DateTime now = new DateTime.now();
 final Workbook workbook = Workbook();

  var lng;

  var lat;
    Worksheet get sheet => workbook.worksheets[0];




         Dio dio = new Dio();
 
  final logger = Logger();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();



   
 
      chartData = getChartData();
    Timer.periodic(const Duration(seconds: 1), updateDataSource);

   }
  
  late int intt;
   getpoints()async {

    isLoading=true;
      setState(() {
          
        });





  String url =("http://139.59.158.53:8000/getpoints");
  isLoading=true;
      setState(() {
          
        });

   logger.d("url is: $url");
   try {

      Response response = await dio.post(
      url,
      
        data: jsonEncode({
"id":shared.getString("id"),

    }),
  
      );
 
           print("1111111111111111111111111");
      if (response.statusCode == 200 || response.statusCode == 201) {
     
 
         logger.d("response is : ${response.data.toString()}"); 
              intt=(response.data['user']['points']) ;
             print(intt);
             intt++;
             updatepoint(intt);
             print("kkkkkk");
  return response.data;
   
        
      } 
  
      
    }on DioError catch (e) {
    
      logger.e("catch error : $e");
    }



}
updatepoint(intt) async {



  String url =("http://139.59.158.53:8000/updatepoints");

   logger.d("url is: $url");
   try {

      Response response = await dio.post(
      url,
      
        data: jsonEncode({
"id":shared.getString("id"),
"points":intt,

    }),
  
      );
 
           print("1111111111111111111111111");
      if (response.statusCode == 200 || response.statusCode == 201) {
     
 
         logger.d("response is : ${response.data.toString()}"); 
             int intt=(response.data['user']['points']) ;
             print(intt);
           
  return response.data;
  
        
      } 
  
      
    }on DioError catch (e) {
    
      logger.e("catch error : $e");
    }
 isLoading=true;
      setState(() {
          
        });

idfile();


}


idfile() async {



  String url =("http://139.59.158.53:8000/fileid");

   logger.d("url is: $url");
   try {

      Response response = await dio.post(
      url,
      
        data: jsonEncode({

    "date":now,
    "analyzed": false,
      
      "fileID": count,
      "userID":shared.getString("id"),

    }),
  
      );
 
           print("1111111111111111111111111");
      if (response.statusCode == 200 || response.statusCode == 201) {
     
 
         logger.d("response is : ${response.data.toString()}"); 
             int intt=(response.data['user']['points']) ;
             print(intt);
           
  return response.data;
   
        
      } 
  
      
    }on DioError catch (e) {
    
      logger.e("catch error : $e");
    }


 isLoading=true;
      setState(() {
          
        });


}
  
bool isLoading=false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: isLoading ==true?Center(child: CircularProgressIndicator())
         :Scaffold(
                 appBar: AppBar(
        centerTitle: true,
        title: const Text(" تسجيل جديد ",textDirection: TextDirection.rtl,textAlign: TextAlign.center,style: const TextStyle(color: Colors.white),),
        //leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back)),
       elevation: 10,
      backgroundColor: Colors.green,
      //systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.red),
      ),
            body:Container( 
               child:ListView(
                 children:[ 
                   Container(
                     height: 400,width: 500,
                     child: charts.SfCartesianChart(
                series: <charts.LineSeries<LiveData, int>>[
          charts.LineSeries<LiveData, int>(
            onRendererCreated: (charts.ChartSeriesController controller) {
              _chartSeriesController = controller;
            },
            dataSource: chartData,
            color: Color.fromARGB(255, 51, 177, 128),
            xValueMapper: (LiveData sales, _) => sales.time,
            yValueMapper: (LiveData sales, _) => sales.speed,
          )
        ],
                primaryXAxis: charts.NumericAxis(
                    majorGridLines: const charts.MajorGridLines(width: 0),
                    edgeLabelPlacement: charts.EdgeLabelPlacement.shift,
                    interval: 3,
                    title: charts.AxisTitle(text:" الفترة الزمنية للتسجيل بالثواني         ")),
                primaryYAxis: charts.NumericAxis(
                    axisLine: const charts.AxisLine(width: 0),
                    majorTickLines: const charts.MajorTickLines(size: 0,color: Colors.blue),
                    title: charts.AxisTitle(text: 'الذبذبات')))),
                            Container(
                  height: 70,
                  width: 100,
                  padding: const EdgeInsets.all(10),
                  child: ElevatedButton(
                    child:  Text(
                    
                      ' بدأ التسجيل ',
                      style: TextStyle(color: Colors.white,fontSize: 20),
                      textDirection: TextDirection.rtl,
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                      ),

                      //side: BorderSide(style: BorderStyle.solid),
                      // shape: OutlinedBorder(),
                      primary: Color.fromARGB(172, 81, 233, 35),
                    ),
                onPressed:startrecord,
                  )),                     Container(
                  height: 70,
                  width: 100,
                  padding: const EdgeInsets.all(10),
                  child: ElevatedButton(
                    child:  Text(
                    
                      ' ايقاف التسجيل ',
                      style: TextStyle(color: Colors.white,fontSize: 20),
                      textDirection: TextDirection.rtl,
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                      ),

                      //side: BorderSide(style: BorderStyle.solid),
                      // shape: OutlinedBorder(),
                      primary: Color.fromARGB(172, 202, 34, 22),
                    ),
                   onPressed:createExcel,
                  )),
                  ]
                   ))));
  }

  int time = 19;
  void updateDataSource(Timer timer) {

    chartData.add(LiveData(time++, z1));
    chartData.removeAt(0);
    _chartSeriesController.updateDataSource(
        addedDataIndex: chartData.length - 1, removedDataIndex: 0);
  }

  List<LiveData> getChartData() {
    int x=z1;
    return <LiveData>[
      LiveData(0, z1),
      
      LiveData(1, x),
      LiveData(2, x),
      LiveData(3, x),
      LiveData(4, x),
      LiveData(5, x),
      LiveData(6, x),
      LiveData(7, x),
      LiveData(8, x),
      LiveData(9, x),
      LiveData(10, x),
      LiveData(11, x),
      LiveData(12, x),
      LiveData(13, x),
      LiveData(14, x),
      LiveData(15, x),
      LiveData(16, x),
      LiveData(17, x),
      LiveData(18, x)
    ];
     print(x);
  } 
  
   Future<void> createExcel() async {
      isLoading=true;
      setState(() {
          
        });
 

   final List<int> bytes = workbook.saveAsStream();
    workbook.dispose();


      final String path = (await getApplicationSupportDirectory()).path;
      final String fileName =
          Platform.isWindows ? '$path\\Output.xlsx' : '$path/Output.xlsx';
      final File file = File(fileName);
      await file.writeAsBytes(bytes, flush: true);
     // OpenFile.open(fileName);
      uploadfile(file);
      Navigator.pushAndRemoveUntil(
  context,
  MaterialPageRoute(builder: (context) => sens()),
  (Route<dynamic> route) => false,
);
  // 
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
                           
                              
                            }}

  startrecord() {
  
    print("object");
      int i=1;
      /*
 sheet.getRangeByIndex(0, 3).setText("Z");
sheet.getRangeByIndex(0, 1).setText("X");
sheet.getRangeByIndex(0, 2).setText("Y");
sheet.getRangeByIndex(0, 4).setText("Index");
*/
  double j=1;
 
   
    accelerometerEvents.listen((AccelerometerEvent event) async {
   
     x1 =await  event.x.round();
     y1 =await event.y.round();
     z1 = await event.z.round();
    i++;
    getPosition();
     cl=await Geolocator.getCurrentPosition().then((value) => value);
                   print("lat ${cl.latitude}");
                             print("long ${cl.longitude}");
                   print("object");
                  lat=cl.latitude;
                     
                   
                   lng=cl.longitude;
                 
                 
    sheet.getRangeByIndex(i, 3).setValue(z1);

    sheet.getRangeByIndex(i, 1).setValue(x1);
 
    sheet.getRangeByIndex(i, 2).setValue(y1);

sheet.getRangeByIndex(i, 4).setNumber(j);
sheet.getRangeByIndex(i, 5).setNumber(lat);
sheet.getRangeByIndex(i, 6).setNumber(lng);
sheet.getRangeByIndex(i, 7).setDateTime(now);
sheet.getRangeByIndex(i, 8).setValue(count);

    j++; 
  
      
    
    });

  }
  uploadfile(File file) async {
    isLoading=true;
      setState(() {
          
        });
    print("in upload");
   var postUri = Uri.parse("http://s2p1.gis.najah.edu:8000/uploadexcelfile");

http.MultipartRequest request = new http.MultipartRequest("POST", postUri);

http.MultipartFile multipartFile = await http.MultipartFile.fromPath(
    'file', file.path); 

request.files.add(multipartFile);

http.StreamedResponse response = await request.send();


print(response.statusCode);
getpoints();
      
  }
 


}

class LiveData {
  LiveData(this.time, this.speed);
  final int time;
  final num speed;
}
 