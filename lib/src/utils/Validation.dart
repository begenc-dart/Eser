import 'package:eser/src/utils/screen_export.dart';

class Validation {
   String? valigatePhone(BuildContext context, String text) {
    if (text.length < 7) {
      // return AppLocalizations.of(context)!.validationPhone;
      return "";
    }
    else if (text[0] != "6" && text[0] != "7") {
      return AppLocalizations.of(context)!.validationPhone;
    }
    return null;
  }
  String? validateName(BuildContext context, String text) {
    if (text.length < 4) {
      return "Familyanyzy doly girizin";
    }
    return null;
  }
   String? validateAddressName(BuildContext context, String text) {
    if (text.length < 4) {
      return "Maglumaty doly girizin";
    }
    return null;
  }
  String? validateAddress(BuildContext context, String text) {
    if (text.length < 4) {
      return "Maglumaty doly girizin";
    }
    return null;
  }
}