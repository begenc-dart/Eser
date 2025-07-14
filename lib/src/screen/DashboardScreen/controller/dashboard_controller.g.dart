// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DashboardController on _DashboardControllerBase, Store {
  late final _$indexAtom =
      Atom(name: '_DashboardControllerBase.index', context: context);

  @override
  int get index {
    _$indexAtom.reportRead();
    return super.index;
  }

  @override
  set index(int value) {
    _$indexAtom.reportWrite(value, super.index, () {
      super.index = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: '_DashboardControllerBase.loading', context: context);

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
      Atom(name: '_DashboardControllerBase.currentPage', context: context);

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
      Atom(name: '_DashboardControllerBase.hasMore', context: context);

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
      Atom(name: '_DashboardControllerBase.status', context: context);

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
      Atom(name: '_DashboardControllerBase.errorMessage', context: context);

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

  late final _$filterAtom =
      Atom(name: '_DashboardControllerBase.filter', context: context);

  @override
  String get filter {
    _$filterAtom.reportRead();
    return super.filter;
  }

  @override
  set filter(String value) {
    _$filterAtom.reportWrite(value, super.filter, () {
      super.filter = value;
    });
  }

  late final _$productAtom =
      Atom(name: '_DashboardControllerBase.product', context: context);

  @override
  ObservableList<ProductData> get product {
    _$productAtom.reportRead();
    return super.product;
  }

  @override
  set product(ObservableList<ProductData> value) {
    _$productAtom.reportWrite(value, super.product, () {
      super.product = value;
    });
  }

  late final _$searchProductAtom =
      Atom(name: '_DashboardControllerBase.searchProduct', context: context);

  @override
  ObservableList<ProductData> get searchProduct {
    _$searchProductAtom.reportRead();
    return super.searchProduct;
  }

  @override
  set searchProduct(ObservableList<ProductData> value) {
    _$searchProductAtom.reportWrite(value, super.searchProduct, () {
      super.searchProduct = value;
    });
  }

  late final _$_fetchProductAsyncAction =
      AsyncAction('_DashboardControllerBase._fetchProduct', context: context);

  @override
  Future<void> _fetchProduct(
      {bool isInitial = false,
      required String url,
      required ObservableList<ProductData> products}) {
    return _$_fetchProductAsyncAction.run(() => super
        ._fetchProduct(isInitial: isInitial, url: url, products: products));
  }

  late final _$_DashboardControllerBaseActionController =
      ActionController(name: '_DashboardControllerBase', context: context);

  @override
  dynamic carusel_index(int selected_index) {
    final _$actionInfo = _$_DashboardControllerBaseActionController.startAction(
        name: '_DashboardControllerBase.carusel_index');
    try {
      return super.carusel_index(selected_index);
    } finally {
      _$_DashboardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeFilter(String value) {
    final _$actionInfo = _$_DashboardControllerBaseActionController.startAction(
        name: '_DashboardControllerBase.changeFilter');
    try {
      return super.changeFilter(value);
    } finally {
      _$_DashboardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<void> fetchProducts(bool isRefresh) {
    final _$actionInfo = _$_DashboardControllerBaseActionController.startAction(
        name: '_DashboardControllerBase.fetchProducts');
    try {
      return super.fetchProducts(isRefresh);
    } finally {
      _$_DashboardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<void> fetchSearchProducts(String searched, bool isRefreht) {
    final _$actionInfo = _$_DashboardControllerBaseActionController.startAction(
        name: '_DashboardControllerBase.fetchSearchProducts');
    try {
      return super.fetchSearchProducts(searched, isRefreht);
    } finally {
      _$_DashboardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<void> fetchDiscountProducts(bool isRefreht, String url) {
    final _$actionInfo = _$_DashboardControllerBaseActionController.startAction(
        name: '_DashboardControllerBase.fetchDiscountProducts');
    try {
      return super.fetchDiscountProducts(isRefreht, url);
    } finally {
      _$_DashboardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
index: ${index},
loading: ${loading},
currentPage: ${currentPage},
hasMore: ${hasMore},
status: ${status},
errorMessage: ${errorMessage},
filter: ${filter},
product: ${product},
searchProduct: ${searchProduct}
    ''';
  }
}
