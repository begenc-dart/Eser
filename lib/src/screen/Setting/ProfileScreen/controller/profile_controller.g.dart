// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProfileController on _ProfileControllerBase, Store {
  late final _$loadingAtom =
      Atom(name: '_ProfileControllerBase.loading', context: context);

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

  late final _$statusAtom =
      Atom(name: '_ProfileControllerBase.status', context: context);

  @override
  Status get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(Status value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  late final _$profileDataAtom =
      Atom(name: '_ProfileControllerBase.profileData', context: context);

  @override
  ProfileData? get profileData {
    _$profileDataAtom.reportRead();
    return super.profileData;
  }

  @override
  set profileData(ProfileData? value) {
    _$profileDataAtom.reportWrite(value, super.profileData, () {
      super.profileData = value;
    });
  }

  late final _$fetchProfileAsyncAction =
      AsyncAction('_ProfileControllerBase.fetchProfile', context: context);

  @override
  Future<void> fetchProfile() {
    return _$fetchProfileAsyncAction.run(() => super.fetchProfile());
  }

  @override
  String toString() {
    return '''
loading: ${loading},
status: ${status},
profileData: ${profileData}
    ''';
  }
}
