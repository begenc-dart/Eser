
import 'package:eser/src/utils/screen_export.dart';

class Pricesorttextfield extends StatelessWidget {
  TextEditingController controller;
  FocusNode focusNode;
  TapRegionCallback onTapOutside;
  String hintText;
   Pricesorttextfield({required this.controller,required this.focusNode,required this.hintText,required this.onTapOutside});
 
  @override
  Widget build(BuildContext context) {
    return  Expanded(child: TextField(
      style: TextStyle(color: Theme.of(context).colorScheme.primary),
                  focusNode: focusNode,
                  controller: controller,
                  onTapOutside: onTapOutside,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: hintText
                  ),
                ));
  }
}