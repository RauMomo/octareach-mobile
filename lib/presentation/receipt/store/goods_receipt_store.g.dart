// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goods_receipt_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GoodsReceiptStore on _GoodsReceiptStore, Store {
  Computed<bool>? _$loadingComputed;

  @override
  bool get loading => (_$loadingComputed ??= Computed<bool>(() => super.loading,
          name: '_GoodsReceiptStore.loading'))
      .value;

  late final _$fetchPostsFutureAtom =
      Atom(name: '_GoodsReceiptStore.fetchPostsFuture', context: context);

  @override
  ObservableFuture<dynamic> get fetchPostsFuture {
    _$fetchPostsFutureAtom.reportRead();
    return super.fetchPostsFuture;
  }

  @override
  set fetchPostsFuture(ObservableFuture<dynamic> value) {
    _$fetchPostsFutureAtom.reportWrite(value, super.fetchPostsFuture, () {
      super.fetchPostsFuture = value;
    });
  }

  late final _$goodsReceiptListAtom =
      Atom(name: '_GoodsReceiptStore.goodsReceiptList', context: context);

  @override
  GoodsReceiptList? get goodsReceiptList {
    _$goodsReceiptListAtom.reportRead();
    return super.goodsReceiptList;
  }

  @override
  set goodsReceiptList(GoodsReceiptList? value) {
    _$goodsReceiptListAtom.reportWrite(value, super.goodsReceiptList, () {
      super.goodsReceiptList = value;
    });
  }

  late final _$successAtom =
      Atom(name: '_GoodsReceiptStore.success', context: context);

  @override
  bool get success {
    _$successAtom.reportRead();
    return super.success;
  }

  @override
  set success(bool value) {
    _$successAtom.reportWrite(value, super.success, () {
      super.success = value;
    });
  }

  late final _$getPostsAsyncAction =
      AsyncAction('_GoodsReceiptStore.getPosts', context: context);

  @override
  Future<dynamic> getPosts() {
    return _$getPostsAsyncAction.run(() => super.getPosts());
  }

  @override
  String toString() {
    return '''
fetchPostsFuture: ${fetchPostsFuture},
goodsReceiptList: ${goodsReceiptList},
success: ${success},
loading: ${loading}
    ''';
  }
}