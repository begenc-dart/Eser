import 'package:mobx/mobx.dart';

import 'package:eser/src/utils/screen_export.dart';
part 'filter_controller.g.dart';

class FilterController = _FilterControllerBase with _$FilterController;

abstract class _FilterControllerBase with Store {
  final maxController = TextEditingController();
  final minController = TextEditingController();
  final maxFocus = FocusNode();
  final minFocus = FocusNode();
  clearController() {
    maxController.clear();
    minController.clear();
     select_sort = "default";
  }

  dispose() {
    maxController.dispose();
    minController.dispose();
    maxFocus.dispose();
    minFocus.dispose();
  }

  @observable
  String select_sort = "default";
  @action
  change_value(String value) {
    select_sort = value;
  }

  List<Filtermodel> filterList = [];
  init_sort(BuildContext context) {
    filterList = [
      Filtermodel(title: AppLocalizations.of(context)!.defaut, value: "default"),
      Filtermodel(title: AppLocalizations.of(context)!.chipToExpensive, value: "cheep"),
      Filtermodel(title: AppLocalizations.of(context)!.expensiveToChip, value: "expensive"),
      Filtermodel(title: AppLocalizations.of(context)!.discount, value: "discount"),
      Filtermodel(title: AppLocalizations.of(context)!.newProduct, value: "new"),
    ];
  }
}
