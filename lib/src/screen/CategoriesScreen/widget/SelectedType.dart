import 'package:flutter/material.dart';
import 'package:eser/src/utils/screen_export.dart';

class Selectedtype extends StatelessWidget {
  VoidCallback onTap;
  String title;
  bool isCategories;
  Selectedtype({
    required this.isCategories,
    required this.onTap,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 55,
          decoration: BoxDecoration(
            color:
                isCategories ? Theme.of(context).colorScheme.secondary : null,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              title,
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color:
                    isCategories
                        ? Theme.of(context).colorScheme.onPrimaryFixed
                        : Theme.of(context).colorScheme.secondary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
