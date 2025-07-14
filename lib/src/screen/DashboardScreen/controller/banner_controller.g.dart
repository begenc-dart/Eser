// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BannerController on _BannerControllerBase, Store {
  late final _$loadingAtom =
      Atom(name: '_BannerControllerBase.loading', context: context);

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

  late final _$bannerAtom =
      Atom(name: '_BannerControllerBase.banner', context: context);

  @override
  ObservableList<BannerData> get banner {
    _$bannerAtom.reportRead();
    return super.banner;
  }

  @override
  set banner(ObservableList<BannerData> value) {
    _$bannerAtom.reportWrite(value, super.banner, () {
      super.banner = value;
    });
  }

  late final _$statusAtom =
      Atom(name: '_BannerControllerBase.status', context: context);

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

  late final _$fetchBannerAsyncAction =
      AsyncAction('_BannerControllerBase.fetchBanner', context: context);

  @override
  Future<void> fetchBanner() {
    return _$fetchBannerAsyncAction.run(() => super.fetchBanner());
  }

  @override
  String toString() {
    return '''
loading: ${loading},
banner: ${banner},
status: ${status}
    ''';
  }
}
