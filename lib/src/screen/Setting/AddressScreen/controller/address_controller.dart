import 'dart:developer';

import 'package:mobx/mobx.dart';
import 'package:eser/src/core/network/states/status.dart';
import 'package:eser/src/screen/Setting/AddressScreen/repository/api/AddressApi.dart';
import 'package:eser/src/screen/Setting/AddressScreen/repository/data/AddressGetData.dart';
import 'package:eser/src/utils/screen_export.dart';
part 'address_controller.g.dart';

class AddressController = _AddressControllerBase with _$AddressController;

abstract class _AddressControllerBase with Store {
  FocusNode addressNameFocus = FocusNode();
  FocusNode addressFocus = FocusNode();
  TextEditingController addressNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  Addressapi api = Addressapi();
  clearAddress() {
    addressController.clear();
    addressNameController.clear();
  }

  @action
  Future<void> addAddress(
    BuildContext context,
    VoidCallback completeCallback,
  ) async {
    var data = AddressPostData(
      locationAddress: addressController.text,
      locationAddressRu: "gerekdal",
      locationName: addressNameController.text,
      locationNameRu: "gerekdal",
    );
    try {
      log(data.toString());
      await api.postAddress(data).then((e) {
        Toastwidget().toast(context, AppLocalizations.of(context)!.addresAdded);
        fetchAddress();
        completeCallback();
      });
    } catch (e) {
      log('Error submitting product: $e');
    }
  }

  @observable
  bool loading = false;
  @observable
  ObservableList<AddressGetData> address = ObservableList.of([]);
  @observable
  Status status = Status.none;

  @action
  Future<void> fetchAddress() async {
    loading = true;
    address.clear();

    try {
      status = Status.loading;

      final newItems = await api.getAddress();

      address = ObservableList.of(newItems);
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

  @action
  Future deleteAddress(
    BuildContext context,
    VoidCallback completeCallback,
    String location_id,
    int index,
  ) async {
    try {
      api.deleteLocation(location_id).then((e) {
        address.removeAt(index);
        completeCallback();
      });
    } catch (e) {
      Toastwidget().toast(context, AppLocalizations.of(context)!.errorDelete);
    }
  }

  @action
  initUpdate(String address, String addressName) {
    addressController = TextEditingController(text: address);
    addressNameController = TextEditingController(text: addressName);
  }

  @action
  Future<void> putAddress(
    BuildContext context,
    VoidCallback completeCallback,
    String id,
  ) async {
    var data = AddressPostData(
      locationAddress: addressController.text,
      locationAddressRu: "gerekdal",
      locationName: addressNameController.text,
      locationNameRu: "gerekdal",
    );
    try {
      log(data.toString());
      await api.putAddress(data, id).then((e) {
        Toastwidget().toast(context, AppLocalizations.of(context)!.putAddress);
        fetchAddress();
        
        completeCallback();
      });
    } catch (e) {
      log('Error submitting product: $e');
    }
  }
}
