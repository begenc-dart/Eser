import 'package:eser/main.dart';
import 'package:eser/src/utils/screen_export.dart';

class Logoutbottomsheep {
  final _keyValueStorageService = KeyValueStorageService();
  var language_controller = GetIt.instance<VerificationController>();
  logOut(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Theme.of(context).colorScheme.onSecondary,
      context: context,
      builder: (context) {
        return Wrap(
          children: [
            SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  Text(
                    AppLocalizations.of(context)!.exit,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  Text(
                    AppLocalizations.of(context)!.exitis,
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Savebutton(
                      onTapCancel: () {
                        Navigator.pop(context);
                      },
                      isColorless: true,
                      onTapConform: ()async {
                        _keyValueStorageService.resetKeys();
                        await GetIt.instance<VerificationController>().tokenGet();
                Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context)=>MainPage()),
                          (e) => false,
                        );
                      },
                      titleCancel: AppLocalizations.of(context)!.no,
                      titleConform: AppLocalizations.of(context)!.yes,
                    ),
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
