import 'package:flutter/material.dart';

class BackGround extends StatelessWidget {
  final Widget child;
  const BackGround({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
            /*
              constraints: BoxConstraints.expand(),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("Assets/BG.jpg"),
                  fit: BoxFit.cover,
                  opacity: 0.8,
                  scale: 0.4,
                ),
              )
              
          ), */
            /*
          Container(
              constraints: BoxConstraints.expand(),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("Assets/logos.jpeg"),
                  opacity: 0.8,
                  scale: 0.4,
                ),
              )),*/
            /*
          Container(
              child: TextButton(
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              primary: Colors.blue,
              backgroundColor: Colors.black12,
            ),
            onPressed: () {},
            child: Text(" تسجيل الدخول "),
          )),
          
          Container(
              child: TextButton(
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              primary: Colors.blue,
              backgroundColor: Colors.black12,
            ),
            onPressed: () {},
            child: Text(" انشاء حساب "),
          ))
          /*
          Positioned(
            top: 0,
            bottom: 0,
             
            button
          ),*/*/
          )
        ],
      ),
    );
  }
}
