import 'package:eser/src/utils/screen_export.dart';

class Languagebottomsheep {
  var controller = GetIt.instance<LangugaeController>();
  bottomSheep(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Theme.of(context).colorScheme.onSecondary,
      context: context,
      builder: (context) {
        return Wrap(
          children: [
            Observer(
              builder: (_) {
                return Column(
                  children: [
                    Text(
                      AppLocalizations.of(context)!.language,
                      style: Theme.of(
                        context,
                      ).textTheme.labelMedium!.copyWith(fontSize: 24),
                    ),
                    for (int i = 0; i < language.length; i++)
                      RadioListTile(
                        title: Text(
                          language[i].title,
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                        value: language[i].value,
                        groupValue: controller.language,
                        activeColor: Theme.of(context).colorScheme.secondary,
                        onChanged: (value) {
                          controller.updateLanguage("language", value!);
                          controller.change(value);
                          controller.changeLanguage(value);
                          Navigator.pop(context);
                        },
                      ),
                  ],
                );
              },
            ),
          ],
        );
      },
    );
  }
}
