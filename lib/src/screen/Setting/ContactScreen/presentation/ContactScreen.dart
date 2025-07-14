import 'package:eser/src/utils/screen_export.dart';

class Contactscreen extends StatelessWidget {
  Contactscreen({super.key});
  var controller = GetIt.instance<ContactController>();
  var _keys = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Containerbutton(
        onTap: () {
          controller.contactApi(context, _keys, () {
            Navigator.pop(context);
          });
        },
        title: AppLocalizations.of(context)!.next,
      ),
      appBar: AppBar(),
      body: Form(
        key: _keys,
        child: Column(
          children: [
            Texteditwidget(
              controller: controller.nameController,
              validation: (value) {
                return Validation().validateName(context, value!);
              },
              focus: controller.nameFocus,
              onTapOutside: (context) {
                controller.nameFocus.unfocus();
              },
              hintText: AppLocalizations.of(context)!.name,
            ),
            Texteditwidget(
              prefixText: "+993",
              type: TextInputType.number,
              controller: controller.phoneController,
              validation: (value) {
                return Validation().valigatePhone(context, value!);
              },
              focus: controller.phoneFocus,
              onTapOutside: (context) {
                controller.phoneFocus.unfocus();
              },
              hintText: AppLocalizations.of(context)!.phone,
            ),
            Texteditwidget(
              type: TextInputType.multiline,
              maxLines: 4,
              controller: controller.tekstController,
              validation: (value) {
                return null;
              },
              focus: controller.tekstFocus,
              onTapOutside: (context) {
                controller.tekstFocus.unfocus();
              },
              hintText: AppLocalizations.of(context)!.text,
            ),
          ],
        ),
      ),
    );
  }
}
