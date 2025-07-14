import 'dart:async';
import 'dart:developer';

import 'package:mobx/mobx.dart';
import 'package:eser/src/screen/auth/VerificationScreen/repository/api/VerificationApi.dart';
import 'package:eser/src/screen/auth/VerificationScreen/repository/data/VerificationData.dart';
import 'package:eser/src/utils/ToastWidget.dart';
import 'package:eser/src/utils/screen_export.dart';
part 'verification_controller.g.dart';

class VerificationController = _VerificationControllerBase
    with _$VerificationController;

abstract class _VerificationControllerBase with Store {
  @observable
  bool onEditing = true;
  @observable
  String code = "";

  @action
  void writingCode(String value) {
    code = value;
  }

  @action
  void isEditing(bool value) {
    onEditing = value;
  }

  @observable
  int seconds = 5; // 2 minutes

  Timer? _timer;

  @computed
  String get formattedTime {
    int min = seconds ~/ 60;
    int sec = seconds % 60;
    return '$min:${sec.toString().padLeft(2, '0')}';
  }

  @action
  void startTimer() {
    _timer?.cancel();
    seconds = 5;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (seconds > 0) {
        seconds--;
      } else {
        timer.cancel();
      }
    });
  }

  @action
  void resetTimer() {
    _timer?.cancel();
    seconds = 120;
  }

  var _api = VerificationApi();
  // final _api = Verificationrepository();

  @readonly
  ObservableFuture? _future;
  @observable
  ObservableMap position = ObservableMap.of({});
  void dispose() {
    _timer?.cancel();
  }

  final _keyValueStorageService = KeyValueStorageService();
  void _updateToken(String key, String newToken) {
    _keyValueStorageService.setAuthToken(key, newToken.toString());
  }

  // @action
  // refreshToken()async{
  //        var refreshdto = RefreshDto(refresh: await screen);
  //     _api.refresh(refreshdto, _updateToken);
  // }
  @observable
  ObservableFuture<String> screen = ObservableFuture.value('');
@observable
  bool loading = false;
  @observable
  bool hasData = false;
 @action
  Future<void> tokenGet() async {
    try {
      loading = true;
      final future = _keyValueStorageService.getAuthToken("token");
      
      screen = ObservableFuture(future);
      await future;
      hasData = screen.value!.isNotEmpty &&screen.value !=null; 
      loading = false;
    } catch (e) {
      throw Exception(e);
    }
  }

  @action
  void verification(
    BuildContext context,
    VoidCallback completeCallback,
    String phone,
  ) {
    if (!onEditing) {
      final dto = VerificationData(code: code, phone: phone);

      try {
        _future = ObservableFuture(_api.verification(dto, _updateToken)).then((
          value,
        ) {
          position = ObservableMap.of(value);

          completeCallback();
        });
      } catch (e) {
        Toastwidget().toastError(
          context,
          AppLocalizations.of(context)!.fullData,
        );
        _future = ObservableFuture.error(e);
      }
    }
  }
}
