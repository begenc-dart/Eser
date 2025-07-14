// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verification_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$VerificationController on _VerificationControllerBase, Store {
  Computed<String>? _$formattedTimeComputed;

  @override
  String get formattedTime =>
      (_$formattedTimeComputed ??= Computed<String>(() => super.formattedTime,
              name: '_VerificationControllerBase.formattedTime'))
          .value;

  late final _$onEditingAtom =
      Atom(name: '_VerificationControllerBase.onEditing', context: context);

  @override
  bool get onEditing {
    _$onEditingAtom.reportRead();
    return super.onEditing;
  }

  @override
  set onEditing(bool value) {
    _$onEditingAtom.reportWrite(value, super.onEditing, () {
      super.onEditing = value;
    });
  }

  late final _$codeAtom =
      Atom(name: '_VerificationControllerBase.code', context: context);

  @override
  String get code {
    _$codeAtom.reportRead();
    return super.code;
  }

  @override
  set code(String value) {
    _$codeAtom.reportWrite(value, super.code, () {
      super.code = value;
    });
  }

  late final _$secondsAtom =
      Atom(name: '_VerificationControllerBase.seconds', context: context);

  @override
  int get seconds {
    _$secondsAtom.reportRead();
    return super.seconds;
  }

  @override
  set seconds(int value) {
    _$secondsAtom.reportWrite(value, super.seconds, () {
      super.seconds = value;
    });
  }

  late final _$_futureAtom =
      Atom(name: '_VerificationControllerBase._future', context: context);

  ObservableFuture<dynamic>? get future {
    _$_futureAtom.reportRead();
    return super._future;
  }

  @override
  ObservableFuture<dynamic>? get _future => future;

  @override
  set _future(ObservableFuture<dynamic>? value) {
    _$_futureAtom.reportWrite(value, super._future, () {
      super._future = value;
    });
  }

  late final _$positionAtom =
      Atom(name: '_VerificationControllerBase.position', context: context);

  @override
  ObservableMap<dynamic, dynamic> get position {
    _$positionAtom.reportRead();
    return super.position;
  }

  @override
  set position(ObservableMap<dynamic, dynamic> value) {
    _$positionAtom.reportWrite(value, super.position, () {
      super.position = value;
    });
  }

  late final _$screenAtom =
      Atom(name: '_VerificationControllerBase.screen', context: context);

  @override
  ObservableFuture<String> get screen {
    _$screenAtom.reportRead();
    return super.screen;
  }

  @override
  set screen(ObservableFuture<String> value) {
    _$screenAtom.reportWrite(value, super.screen, () {
      super.screen = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: '_VerificationControllerBase.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$hasDataAtom =
      Atom(name: '_VerificationControllerBase.hasData', context: context);

  @override
  bool get hasData {
    _$hasDataAtom.reportRead();
    return super.hasData;
  }

  @override
  set hasData(bool value) {
    _$hasDataAtom.reportWrite(value, super.hasData, () {
      super.hasData = value;
    });
  }

  late final _$tokenGetAsyncAction =
      AsyncAction('_VerificationControllerBase.tokenGet', context: context);

  @override
  Future<void> tokenGet() {
    return _$tokenGetAsyncAction.run(() => super.tokenGet());
  }

  late final _$_VerificationControllerBaseActionController =
      ActionController(name: '_VerificationControllerBase', context: context);

  @override
  void writingCode(String value) {
    final _$actionInfo = _$_VerificationControllerBaseActionController
        .startAction(name: '_VerificationControllerBase.writingCode');
    try {
      return super.writingCode(value);
    } finally {
      _$_VerificationControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void isEditing(bool value) {
    final _$actionInfo = _$_VerificationControllerBaseActionController
        .startAction(name: '_VerificationControllerBase.isEditing');
    try {
      return super.isEditing(value);
    } finally {
      _$_VerificationControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void startTimer() {
    final _$actionInfo = _$_VerificationControllerBaseActionController
        .startAction(name: '_VerificationControllerBase.startTimer');
    try {
      return super.startTimer();
    } finally {
      _$_VerificationControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetTimer() {
    final _$actionInfo = _$_VerificationControllerBaseActionController
        .startAction(name: '_VerificationControllerBase.resetTimer');
    try {
      return super.resetTimer();
    } finally {
      _$_VerificationControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void verification(
      BuildContext context, VoidCallback completeCallback, String phone) {
    final _$actionInfo = _$_VerificationControllerBaseActionController
        .startAction(name: '_VerificationControllerBase.verification');
    try {
      return super.verification(context, completeCallback, phone);
    } finally {
      _$_VerificationControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
onEditing: ${onEditing},
code: ${code},
seconds: ${seconds},
position: ${position},
screen: ${screen},
loading: ${loading},
hasData: ${hasData},
formattedTime: ${formattedTime}
    ''';
  }
}
