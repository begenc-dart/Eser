import 'package:eser/src/utils/screen_export.dart';

class Texteditwidget extends StatelessWidget {
  TextEditingController controller;
  FocusNode focus;
  bool obscured;
  String? prefixText;
  TextInputType type;
  FormFieldValidator<String> validation;
  TapRegionCallback onTapOutside;
  IconButton? icons;
  EdgeInsets? textPadding;
  EdgeInsets? fieldPadding;
  int maxLines;
  String initVal = "";
  String? hintText;
  int? maxLength;
  List<LengthLimitingTextInputFormatter>? lenght = [];
  bool readOnly;
  Texteditwidget({
    required this.controller,

    required this.validation,
    required this.focus,
    this.lenght = const [],
    this.obscured = false,
    this.prefixText = null,
    this.readOnly = false,
    this.type = TextInputType.text,
    this.maxLines = 1,
    required this.onTapOutside,
    this.icons = null,
    this.textPadding = const EdgeInsets.only(left: 15, right: 15, bottom: 5),
    this.fieldPadding = const EdgeInsets.only(
      left: 15,
      right: 15,
      top: 5,
      bottom: 10,
    ),
    this.initVal = "",
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: fieldPadding!,
      child: TextFormField(
        // initialValue: initVal,
        style: Theme.of(context).textTheme.bodyMedium,
        cursorColor: Colors.black,
        // initialValue: initVal,
        onTapOutside: onTapOutside,
        // cursorHeight: 10,
        validator: validation,
        obscureText: obscured,
        controller: controller,
        keyboardType: type,
        readOnly: readOnly,
        inputFormatters: lenght,
        maxLines: maxLines,

        decoration: InputDecoration(
          labelText: hintText,
          hintStyle: Theme.of(context).textTheme.labelSmall,
          prefixText: prefixText,
          prefixStyle: Theme.of(context).textTheme.labelSmall!,
          suffixIcon: icons,
        ),
        focusNode: focus,
      ),
    );
  }
}
