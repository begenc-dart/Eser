import 'package:flutter/material.dart';

class Selectedauthcontainer extends StatelessWidget {
  String title;
  Color color;
  TextStyle style;
  VoidCallback onTap;
  Selectedauthcontainer({
    required this.title,
    required this.color,
    required this.style,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
       
        width: double.infinity,
        height: 55,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(child: Text(title, style: style)),
      ),
    );
  }
}
