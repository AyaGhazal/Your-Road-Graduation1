import 'package:flutter/material.dart';



class DefaultBackButton extends StatelessWidget {
  const DefaultBackButton({
    required Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back_ios, color: Colors.white),
      onPressed: () => Navigator.of(context).pop(),
    );
  }
}