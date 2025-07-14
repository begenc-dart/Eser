import 'dart:developer';

import 'package:mobx/mobx.dart';
import 'package:eser/src/core/network/states/status.dart';
import 'package:eser/src/screen/DashboardScreen/repository/api/BannerApi.dart';
import 'package:eser/src/screen/DashboardScreen/repository/data/BannerData.dart';
part 'banner_controller.g.dart';

class BannerController = _BannerControllerBase with _$BannerController;

abstract class _BannerControllerBase with Store {
  
  @observable
  bool loading = false;
  @observable
  ObservableList<BannerData> banner = ObservableList.of([]);
  @observable
  Status status = Status.none;
  Bannerapi api = Bannerapi();
  @action
  Future<void> fetchBanner() async {
    loading = true;
    banner.clear();

    try {
      status = Status.loading;

      final newItems = await api.getBanner();

      banner = ObservableList.of(newItems);
      status = Status.completed;
      loading = false;
    } catch (e) {
      log(e.toString());
      status = Status.error;
      loading = false;
    } finally {
      loading = false;
    }
  }
}