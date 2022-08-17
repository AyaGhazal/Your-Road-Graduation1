import 'package:flutter/material.dart';
import 'package:second/LogIn.dart';
import 'package:second/sign.dart';

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: <Widget>[
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
        
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.all(8),
        alignment: Alignment.center,
        // color: Color.fromARGB(255, 134, 156, 147),
        child: Column(

             mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 300,
        width: 300,
                alignment: Alignment.center,
                child: Image.asset(
                  "images/log1.png",
                ),
              ),
              Container(
                height: 70,
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                child: ElevatedButton(
                  child: const Text(
                    ' تسجيل الدخول',
                    style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    ),
                    primary: Color.fromARGB(172, 81, 233, 35),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LogIn()),
                    );
                  },
                ),
              ),
              Container(
                  height: 70,
                  width: double.infinity,
                  padding: const EdgeInsets.all(9),
                  child: ElevatedButton(
                    child: const Text(
                      'انشاء حساب',
                      style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                      ),
                      primary: Color.fromARGB(200, 11, 88, 24),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => signup()),
                      );
                    },
                  )),
            ]),
      ),
    ]));
  }
}
