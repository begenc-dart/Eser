import 'package:eser/src/themes/theme_manager.dart';
import 'package:eser/src/utils/screen_export.dart';
import 'package:skeletonizer/skeletonizer.dart';

class Profilescreen extends StatefulWidget {
  Profilescreen({super.key});

  @override
  State<Profilescreen> createState() => _ProfilescreenState();
}

class _ProfilescreenState extends State<Profilescreen> {
  var controller = GetIt.instance<ProfileController>();

  var theme_controller = GetIt.instance<ThemeStore>();
@override
  void initState() {
    // TODO: implement initState
    controller.fetchProfile();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    controller.initProfile(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.profile,
          style: Theme.of(
            context,
          ).textTheme.labelMedium!.copyWith(fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: Observer(
        builder: (_) {
          return Skeletonizer(
            enableSwitchAnimation: true,
                enabled: controller.loading,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: Theme.of(context).colorScheme.onPrimary,
                        radius: 35,
                        child: Text(
                          controller.profileData!.fullName![0].toUpperCase(),
                          style: Theme.of(
                            context,
                          ).textTheme.labelSmall!.copyWith(fontSize: 36),
                        ),
                      ),
                      Text(
                        controller.profileData!.fullName!,
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        controller.profileData!.phone!,
                        style: Theme.of(
                          context,
                        ).textTheme.labelSmall!.copyWith(fontSize: 14),
                      ),
                      SizedBox(height: 20),
                      for (int i = 0; i < controller.profile.length; i++)
                        Observer(
                          builder: (_) {
                            return Profilebox(
                              title: controller.profile[i].title,
                              url: controller.profile[i].url,
                              onTap:
                                  i == 0
                                      ? () {
                                        Languagebottomsheep().bottomSheep(context);
                                      }
                                      : controller.profile[i].onTap,
                              radius: controller.profile[i].radius,
                              istheme: controller.profile[i].isTheme,
                              isDark: theme_controller.isDark,
                              onChanged: (value) {
                                theme_controller.change_theme();
                                theme_controller.toggleTheme(theme_controller.isDark);
                              },
                            );
                          },
                        ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Logoutbottomsheep().logOut(context);
                        },
                        child: Row(
                          children: [
                            SvgPicture.asset(Staticsimage.logOut),
                            SizedBox(width: 10),
                            Text(
                              AppLocalizations.of(context)!.exit,
                              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                color: Theme.of(context).colorScheme.error,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(),
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}
