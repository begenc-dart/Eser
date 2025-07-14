import 'package:flutter/material.dart';
import 'package:eser/src/utils/screen_export.dart';

class Profilebox extends StatelessWidget {
  BorderRadius radius;
  String title;
  String url;
  VoidCallback onTap;
  bool istheme;
  ValueChanged<bool>? onChanged;
  bool isDark;
  Profilebox({
    this.radius = BorderRadius.zero,
    required this.title,
    required this.url,
    required this.onTap,
    this.onChanged,
    this.isDark = false,
    this.istheme = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onPrimary,
          border: Border.symmetric(
            horizontal: BorderSide(
              color: Theme.of(context).colorScheme.onSecondary,
            ),
          ),
          borderRadius: radius,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  url,
                  color: Theme.of(context).colorScheme.primary,
                ),
                SizedBox(width: 10),
                Text(
                  title,
                  style: Theme.of(
                    context,
                  ).textTheme.labelSmall!.copyWith(fontSize: 16),
                ),
              ],
            ),
            istheme
                ? Switch(value: isDark, onChanged: onChanged)
                : Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Theme.of(context).colorScheme.primary,
                ),
          ],
        ),
      ),
    );
  }
}
