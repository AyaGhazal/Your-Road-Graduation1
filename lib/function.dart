 /*
// ignore_for_file: prefer_const_constructors, unnecessary_new, unused_local_variable

import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:io';
//import 'dart:js';

//import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
// ignore: unnecessary_import
import 'package:camera/camera.dart';
import 'package:second/complaint.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart' ;
import 'package:path/path.dart' as Path;
 
 String basename(String path) => Path.context.basename(path);
 
 
 uploadimg (File file,String url) async {
  var request=http.MultipartRequest("POST",Uri.parse(url)) ;
  var lenght= await file.length();
  var streem=http.ByteStream(file.openRead());
   //var pathimg=basename(file.path);
  var multipart=http.MultipartFile("FileImage",streem,lenght,filename:basename(file.path)) ;
  request.files.add(multipart);
  var myreq=await request.send();
  var respo=await http.Response.fromStream(myreq);
  if (respo.statusCode == 200 || respo.statusCode == 201) {
       
        return JsonDecoder(/*respo.body*/) ;
      }
    }*/

/*

    import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'dart:async';
import 'package:async/async.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class ImageUpload extends StatefulWidget {
  @override
  _ImageUploadState createState() => _ImageUploadState();
}

class _ImageUploadState extends State<ImageUpload> {
  late File _image;
  final picker = ImagePicker();

  Future<void> getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  upload(File imageFile) async {
    // open a bytestream
    var stream =
        new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
    // get file length
    var length = await imageFile.length();

    // string to uri
    var uri = Uri.parse("http://192.168.0.8:3000/upload");

    // create multipart request
    var request = new http.MultipartRequest("POST", uri);

    // multipart that takes file
    var multipartFile = new http.MultipartFile('myFile', stream, length,
        filename: basename(imageFile.path));

    // add file to multipart
    request.files.add(multipartFile);

    // send
    var response = await request.send();
    print(response.statusCode);

    // listen for response
    response.stream.transform(utf8.decoder).listen((value) {
      print(value);
    });
  }

  bool isloaded = false;
  var result;
  fetch() async {
    var response = await http.get('http://192.168.0.8:3000/image');
    result = jsonDecode(response.body);
    print(result[0]['image']);
    setState(() {
      isloaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    fetch();
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text("Select an image"),
          FlatButton.icon(
              onPressed: () async => await getImage(),
              icon: Icon(Icons.upload_file),
              label: Text("Browse")),
          SizedBox(
            height: 20,
          ),
          FlatButton.icon(
              onPressed: () => upload(_image),
              icon: Icon(Icons.upload_rounded),
              label: Text("Upload now")),
          isloaded
              ? Image.network('http://192.168.0.8:3000/${result[0]['image']}')
              : CircularProgressIndicator(),
        ],
      ),
    );
  }
}*/