import 'package:eser/src/utils/screen_export.dart';

class Profilemodel {
  String title; 
  String url;
  VoidCallback onTap;
  BorderRadius radius;
  bool isTheme;
  Profilemodel({required this.title,this.isTheme=false,required this.url, this.radius=BorderRadius.zero,required this.onTap});
}
List<Filtermodel> language = [
  Filtermodel(title: "Türkmen dili", value: "tk"),
  
  Filtermodel(title: "Русский язык", value: "ru")
];