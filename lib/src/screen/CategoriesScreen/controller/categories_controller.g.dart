// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CategoriesController on _CategoriesControllerBase, Store {
  late final _$isCategoriesAtom =
      Atom(name: '_CategoriesControllerBase.isCategories', context: context);

  @override
  bool get isCategories {
    _$isCategoriesAtom.reportRead();
    return super.isCategories;
  }

  @override
  set isCategories(bool value) {
    _$isCategoriesAtom.reportWrite(value, super.isCategories, () {
      super.isCategories = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: '_CategoriesControllerBase.loading', context: context);

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
      Atom(name: '_CategoriesControllerBase.status', context: context);

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

  late final _$marketsAtom =
      Atom(name: '_CategoriesControllerBase.markets', context: context);

  @override
  ObservableList<MarketData> get markets {
    _$marketsAtom.reportRead();
    return super.markets;
  }

  @override
  set markets(ObservableList<MarketData> value) {
    _$marketsAtom.reportWrite(value, super.markets, () {
      super.markets = value;
    });
  }

  late final _$newMarketAtom =
      Atom(name: '_CategoriesControllerBase.newMarket', context: context);

  @override
  ObservableList<MarketData> get newMarket {
    _$newMarketAtom.reportRead();
    return super.newMarket;
  }

  @override
  set newMarket(ObservableList<MarketData> value) {
    _$newMarketAtom.reportWrite(value, super.newMarket, () {
      super.newMarket = value;
    });
  }

  late final _$loadingCategoryAtom =
      Atom(name: '_CategoriesControllerBase.loadingCategory', context: context);

  @override
  bool get loadingCategory {
    _$loadingCategoryAtom.reportRead();
    return super.loadingCategory;
  }

  @override
  set loadingCategory(bool value) {
    _$loadingCategoryAtom.reportWrite(value, super.loadingCategory, () {
      super.loadingCategory = value;
    });
  }

  late final _$currentPageAtom =
      Atom(name: '_CategoriesControllerBase.currentPage', context: context);

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
      Atom(name: '_CategoriesControllerBase.hasMore', context: context);

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

  late final _$statusCategoryAtom =
      Atom(name: '_CategoriesControllerBase.statusCategory', context: context);

  @override
  Status get statusCategory {
    _$statusCategoryAtom.reportRead();
    return super.statusCategory;
  }

  @override
  set statusCategory(Status value) {
    _$statusCategoryAtom.reportWrite(value, super.statusCategory, () {
      super.statusCategory = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: '_CategoriesControllerBase.errorMessage', context: context);

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

  late final _$categoryAtom =
      Atom(name: '_CategoriesControllerBase.category', context: context);

  @override
  ObservableList<CategoryData> get category {
    _$categoryAtom.reportRead();
    return super.category;
  }

  @override
  set category(ObservableList<CategoryData> value) {
    _$categoryAtom.reportWrite(value, super.category, () {
      super.category = value;
    });
  }

  late final _$_fetchMarketAsyncAction =
      AsyncAction('_CategoriesControllerBase._fetchMarket', context: context);

  @override
  Future<bool> _fetchMarket(String url, ObservableList<MarketData> marketList) {
    return _$_fetchMarketAsyncAction
        .run(() => super._fetchMarket(url, marketList));
  }

  late final _$_fetchCategyAsyncAction =
      AsyncAction('_CategoriesControllerBase._fetchCategy', context: context);

  @override
  Future<void> _fetchCategy(
      {bool isInitial = false,
      required ObservableList<CategoryData> products}) {
    return _$_fetchCategyAsyncAction.run(
        () => super._fetchCategy(isInitial: isInitial, products: products));
  }

  late final _$_CategoriesControllerBaseActionController =
      ActionController(name: '_CategoriesControllerBase', context: context);

  @override
  void changeType() {
    final _$actionInfo = _$_CategoriesControllerBaseActionController
        .startAction(name: '_CategoriesControllerBase.changeType');
    try {
      return super.changeType();
    } finally {
      _$_CategoriesControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<void> fetchVip(String url) {
    final _$actionInfo = _$_CategoriesControllerBaseActionController
        .startAction(name: '_CategoriesControllerBase.fetchVip');
    try {
      return super.fetchVip(url);
    } finally {
      _$_CategoriesControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<void> fetchNewMarket(String url) {
    final _$actionInfo = _$_CategoriesControllerBaseActionController
        .startAction(name: '_CategoriesControllerBase.fetchNewMarket');
    try {
      return super.fetchNewMarket(url);
    } finally {
      _$_CategoriesControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<void> fetchCategory(bool isRefresh) {
    final _$actionInfo = _$_CategoriesControllerBaseActionController
        .startAction(name: '_CategoriesControllerBase.fetchCategory');
    try {
      return super.fetchCategory(isRefresh);
    } finally {
      _$_CategoriesControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isCategories: ${isCategories},
loading: ${loading},
status: ${status},
markets: ${markets},
newMarket: ${newMarket},
loadingCategory: ${loadingCategory},
currentPage: ${currentPage},
hasMore: ${hasMore},
statusCategory: ${statusCategory},
errorMessage: ${errorMessage},
category: ${category}
    ''';
  }
}
