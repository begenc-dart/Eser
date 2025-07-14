import 'package:flutter/material.dart';
import 'package:eser/src/utils/screen_export.dart';

class Storyinformation extends StatelessWidget {
  String title;
  String url;
   Storyinformation({required this.title,required this.url});

  @override
  Widget build(BuildContext context) {
    return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        SvgPicture.asset(url),
                        SizedBox(width: 8,),
                        Expanded(
                          child: Text(
                            title,
                            style: Theme.of(
                              context,
                            ).textTheme.labelSmall!.copyWith(fontSize: 14,overflow: TextOverflow.fade),
                          ),
                        ),
                      ],
                    ),
                  );
  }
}