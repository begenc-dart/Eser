
import 'package:mobx/mobx.dart';
import 'package:eser/src/core/network/states/status.dart';
import 'package:eser/src/screen/Setting/ProfileScreen/repository/api/ProfileApi.dart';
import 'package:eser/src/screen/Setting/ProfileScreen/repository/data/ProfileData.dart';

import 'package:eser/src/utils/screen_export.dart';
part 'profile_controller.g.dart';

class ProfileController = _ProfileControllerBase with _$ProfileController;

abstract class _ProfileControllerBase with Store {


  List<Profilemodel> profile = [];
  initProfile(BuildContext context) {
    profile = [
      Profilemodel(
        title: AppLocalizations.of(context)!.language,
        url: Staticsimage.language,
        onTap: () {
            },
        radius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      Profilemodel(
        title: AppLocalizations.of(context)!.address,
        url: Staticsimage.address,
        onTap: () {
          Navigator.pushNamed(context, RouteContstants.addressScreenRoute);
        },
      ),
        Profilemodel(
        title: AppLocalizations.of(context)!.order,
        url: Staticsimage.order ,
        onTap: () {
          Navigator.pushNamed(context, RouteContstants.historyScreenRoute);
        },
      ),
      Profilemodel(
        title: AppLocalizations.of(context)!.terms,
        url: Staticsimage.terms,
        onTap: () {
          Navigator.pushNamed(context, RouteContstants.termsScreenRoute);
        },
      ),
      Profilemodel(
        title: AppLocalizations.of(context)!.contace,
        url: Staticsimage.contact,
        onTap: () {
          Navigator.pushNamed(context, RouteContstants.contactScreenRoute);
        },
      ),
      Profilemodel(
        title: AppLocalizations.of(context)!.theme,
        url: Staticsimage.themes,
        isTheme: true,
        onTap: () {
          Navigator.pushNamed(context, RouteContstants.contactScreenRoute);
        },
      ),
      Profilemodel(
        title: AppLocalizations.of(context)!.about,
        url: Staticsimage.about,
        onTap: () {},
        radius: BorderRadius.only(
          bottomLeft: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
      ),
    ];
  }
   @observable
  bool loading = true;
  @observable
  Status status = Status.none;
  ProfileApi repository = ProfileApi();
  @observable
  ProfileData? profileData;
  
  @action
  Future<void> fetchProfile() async {
    loading = true;
    try {
      status = Status.loading;
      final newItems = await repository.getProfile();
      profileData = newItems;
      status = Status.completed;
      loading = false;
    } catch (e) {
      status = Status.error;
      loading = false;
    } finally {
      loading = false;
    }
  }
}
