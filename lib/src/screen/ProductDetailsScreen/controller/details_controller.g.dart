// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DetailsController on _DetailsControllerBase, Store {
  late final _$indexAtom =
      Atom(name: '_DetailsControllerBase.index', context: context);

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

  late final _$selectColorAtom =
      Atom(name: '_DetailsControllerBase.selectColor', context: context);

  @override
  int get selectColor {
    _$selectColorAtom.reportRead();
    return super.selectColor;
  }

  @override
  set selectColor(int value) {
    _$selectColorAtom.reportWrite(value, super.selectColor, () {
      super.selectColor = value;
    });
  }

  late final _$selectSizeAtom =
      Atom(name: '_DetailsControllerBase.selectSize', context: context);

  @override
  int get selectSize {
    _$selectSizeAtom.reportRead();
    return super.selectSize;
  }

  @override
  set selectSize(int value) {
    _$selectSizeAtom.reportWrite(value, super.selectSize, () {
      super.selectSize = value;
    });
  }

  late final _$countAtom =
      Atom(name: '_DetailsControllerBase.count', context: context);

  @override
  int get count {
    _$countAtom.reportRead();
    return super.count;
  }

  @override
  set count(int value) {
    _$countAtom.reportWrite(value, super.count, () {
      super.count = value;
    });
  }

  late final _$isLikeAtom =
      Atom(name: '_DetailsControllerBase.isLike', context: context);

  @override
  bool get isLike {
    _$isLikeAtom.reportRead();
    return super.isLike;
  }

  @override
  set isLike(bool value) {
    _$isLikeAtom.reportWrite(value, super.isLike, () {
      super.isLike = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: '_DetailsControllerBase.loading', context: context);

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
      Atom(name: '_DetailsControllerBase.status', context: context);

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

  late final _$productsAtom =
      Atom(name: '_DetailsControllerBase.products', context: context);

  @override
  OneProductData? get products {
    _$productsAtom.reportRead();
    return super.products;
  }

  @override
  set products(OneProductData? value) {
    _$productsAtom.reportWrite(value, super.products, () {
      super.products = value;
    });
  }

  late final _$imageAtom =
      Atom(name: '_DetailsControllerBase.image', context: context);

  @override
  ObservableList<dynamic> get image {
    _$imageAtom.reportRead();
    return super.image;
  }

  @override
  set image(ObservableList<dynamic> value) {
    _$imageAtom.reportWrite(value, super.image, () {
      super.image = value;
    });
  }

  late final _$fetchProductAsyncAction =
      AsyncAction('_DetailsControllerBase.fetchProduct', context: context);

  @override
  Future<void> fetchProduct({required int product_id}) {
    return _$fetchProductAsyncAction
        .run(() => super.fetchProduct(product_id: product_id));
  }

  late final _$_DetailsControllerBaseActionController =
      ActionController(name: '_DetailsControllerBase', context: context);

  @override
  dynamic change_index(int realIndex) {
    final _$actionInfo = _$_DetailsControllerBaseActionController.startAction(
        name: '_DetailsControllerBase.change_index');
    try {
      return super.change_index(realIndex);
    } finally {
      _$_DetailsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeColor(int colorIndex) {
    final _$actionInfo = _$_DetailsControllerBaseActionController.startAction(
        name: '_DetailsControllerBase.changeColor');
    try {
      return super.changeColor(colorIndex);
    } finally {
      _$_DetailsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeSize(int sizeIndex) {
    final _$actionInfo = _$_DetailsControllerBaseActionController.startAction(
        name: '_DetailsControllerBase.changeSize');
    try {
      return super.changeSize(sizeIndex);
    } finally {
      _$_DetailsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic add_count() {
    final _$actionInfo = _$_DetailsControllerBaseActionController.startAction(
        name: '_DetailsControllerBase.add_count');
    try {
      return super.add_count();
    } finally {
      _$_DetailsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic remove_count() {
    final _$actionInfo = _$_DetailsControllerBaseActionController.startAction(
        name: '_DetailsControllerBase.remove_count');
    try {
      return super.remove_count();
    } finally {
      _$_DetailsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeFavourity() {
    final _$actionInfo = _$_DetailsControllerBaseActionController.startAction(
        name: '_DetailsControllerBase.changeFavourity');
    try {
      return super.changeFavourity();
    } finally {
      _$_DetailsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
index: ${index},
selectColor: ${selectColor},
selectSize: ${selectSize},
count: ${count},
isLike: ${isLike},
loading: ${loading},
status: ${status},
products: ${products},
image: ${image}
    ''';
  }
}
