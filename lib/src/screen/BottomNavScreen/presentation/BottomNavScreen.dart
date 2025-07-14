import 'package:eser/src/utils/screen_export.dart';

class Bottomnavscreen extends StatelessWidget {
  Bottomnavscreen({super.key});
  var controller = GetIt.instance<BottomController>();
  var token = GetIt.instance<VerificationController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (_) {
          return IndexedStack(
            index: controller.index,
            children: [
              Dashboardscreen(),
              Categoriesscreen(),
              Favourityscreen(),
              Cardscreen(),
              !token.hasData ? Welcomescreen() : Profilescreen(),
            ],
          );
        },
      ),
      bottomNavigationBar: Observer(
        builder: (_) {
          return BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: controller.index,
            onTap: (index) {
              controller.changeIndex(index);
            },
            selectedItemColor: Theme.of(context).colorScheme.secondary,
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  Staticsimage.home,
                  color: Theme.of(context).colorScheme.primary,
                ),
                activeIcon: SvgPicture.asset(Staticsimage.home_active),
                label: AppLocalizations.of(context)!.mainPage,
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  Staticsimage.categories,
                  color: Theme.of(context).colorScheme.primary,
                ),
                activeIcon: SvgPicture.asset(Staticsimage.categories_active),
                label: AppLocalizations.of(context)!.category,
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  Staticsimage.favourity,
                  color: Theme.of(context).colorScheme.primary,
                ),
                activeIcon: SvgPicture.asset(Staticsimage.favourity_active),
                label: AppLocalizations.of(context)!.favourity,
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  Staticsimage.sebet,
                  color: Theme.of(context).colorScheme.primary,
                ),
                activeIcon: SvgPicture.asset(Staticsimage.sebet_active),
                label: AppLocalizations.of(context)!.card,
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  Staticsimage.profile,
                  color: Theme.of(context).colorScheme.primary,
                ),
                activeIcon: SvgPicture.asset(Staticsimage.profile_active),
                label: AppLocalizations.of(context)!.profile,
              ),
            ],
          );
        },
      ),
    );
  }
}
