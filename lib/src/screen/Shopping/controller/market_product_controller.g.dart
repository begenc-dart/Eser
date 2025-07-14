// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'market_product_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MarketProductController on _MarketProductControllerBase, Store {
  late final _$loadingAtom =
      Atom(name: '_MarketProductControllerBase.loading', context: context);

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

  late final _$currentPageAtom =
      Atom(name: '_MarketProductControllerBase.currentPage', context: context);

  @override
  int get currentPage {
    _$currentPageAtom.reportRead();
    return super.currentPage;
  }

  @override
  set currentPage(int value) {
    _$currentPageAtom.reportWrite(value, super.currentPage, () {
      super.currentPage = value;
    });
  }

  late final _$hasMoreAtom =
      Atom(name: '_MarketProductControllerBase.hasMore', context: context);

  @override
  bool get hasMore {
    _$hasMoreAtom.reportRead();
    return super.hasMore;
  }

  @override
  set hasMore(bool value) {
    _$hasMoreAtom.reportWrite(value, super.hasMore, () {
      super.hasMore = value;
    });
  }

  late final _$statusAtom =
      Atom(name: '_MarketProductControllerBase.status', context: context);

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

  late final _$errorMessageAtom =
      Atom(name: '_MarketProductControllerBase.errorMessage', context: context);

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$marketsAtom =
      Atom(name: '_MarketProductControllerBase.markets', context: context);

  @override
  Market? get markets {
    _$marketsAtom.reportRead();
    return super.markets;
  }

  @override
  set markets(Market? value) {
    _$marketsAtom.reportWrite(value, super.markets, () {
      super.markets = value;
    });
  }

  late final _$marketAtom =
      Atom(name: '_MarketProductControllerBase.market', context: context);

  @override
  ObservableList<ProductData> get market {
    _$marketAtom.reportRead();
    return super.market;
  }

  @override
  set market(ObservableList<ProductData> value) {
    _$marketAtom.reportWrite(value, super.market, () {
      super.market = value;
    });
  }

  late final _$_fetchProductAsyncAction = AsyncAction(
      '_MarketProductControllerBase._fetchProduct',
      context: context);

  @override
  Future<void> _fetchProduct(
      {bool isInitial = false,
      required int product_id,
      required ObservableList<ProductData> products}) {
    return _$_fetchProductAsyncAction.run(() => super._fetchProduct(
        isInitial: isInitial, product_id: product_id, products: products));
  }

  late final _$_MarketProductControllerBaseActionController =
      ActionController(name: '_MarketProductControllerBase', context: context);

  @override
  Future<void> fetchProduct(bool isRefresh, int market_id) {
    final _$actionInfo = _$_MarketProductControllerBaseActionController
        .startAction(name: '_MarketProductControllerBase.fetchProduct');
    try {
      return super.fetchProduct(isRefresh, market_id);
    } finally {
      _$_MarketProductControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
currentPage: ${currentPage},
hasMore: ${hasMore},
status: ${status},
errorMessage: ${errorMessage},
markets: ${markets},
market: ${market}
    ''';
  }
}
