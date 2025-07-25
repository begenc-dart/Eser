// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_get_data.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CardGetData on _CardGetDataBase, Store {
  late final _$sumAtom = Atom(name: '_CardGetDataBase.sum', context: context);

  @override
  double get sum {
    _$sumAtom.reportRead();
    return super.sum;
  }

  @override
  set sum(double value) {
    _$sumAtom.reportWrite(value, super.sum, () {
      super.sum = value;
    });
  }

  late final _$productsAtom =
      Atom(name: '_CardGetDataBase.products', context: context);

  @override
  ObservableList<Product> get products {
    _$productsAtom.reportRead();
    return super.products;
  }

  @override
  set products(ObservableList<Product> value) {
    _$productsAtom.reportWrite(value, super.products, () {
      super.products = value;
    });
  }

  @override
  String toString() {
    return '''
sum: ${sum},
products: ${products}
    ''';
  }
}

mixin _$Product on _ProductBase, Store {
  late final _$sumAtom = Atom(name: '_ProductBase.sum', context: context);

  @override
  double? get sum {
    _$sumAtom.reportRead();
    return super.sum;
  }

  @override
  set sum(double? value) {
    _$sumAtom.reportWrite(value, super.sum, () {
      super.sum = value;
    });
  }

  late final _$countAtom = Atom(name: '_ProductBase.count', context: context);

  @override
  int? get count {
    _$countAtom.reportRead();
    return super.count;
  }

  @override
  set count(int? value) {
    _$countAtom.reportWrite(value, super.count, () {
      super.count = value;
    });
  }

  @override
  String toString() {
    return '''
sum: ${sum},
count: ${count}
    ''';
  }
}
