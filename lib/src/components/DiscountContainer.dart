import 'package:flutter/material.dart';

class Discountcontainer extends StatelessWidget {
  Color colors; String title;
  Discountcontainer({required this.colors,required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: colors,
      ),
      child: Text(title, style: Theme.of(context).textTheme.bodySmall),
    );
  }
}