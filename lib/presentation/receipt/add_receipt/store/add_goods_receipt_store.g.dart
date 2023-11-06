// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_goods_receipt_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AddGoodsReceiptStore on _AddGoodsReceiptStore, Store {
  late final _$postGoodsReceiptAtom =
      Atom(name: '_AddGoodsReceiptStore.postGoodsReceipt', context: context);

  @override
  ObservableFuture<dynamic> get postGoodsReceipt {
    _$postGoodsReceiptAtom.reportRead();
    return super.postGoodsReceipt;
  }

  @override
  set postGoodsReceipt(ObservableFuture<dynamic> value) {
    _$postGoodsReceiptAtom.reportWrite(value, super.postGoodsReceipt, () {
      super.postGoodsReceipt = value;
    });
  }

  late final _$goodsReceiptAtom =
      Atom(name: '_AddGoodsReceiptStore.goodsReceipt', context: context);

  @override
  GoodsReceipt? get goodsReceipt {
    _$goodsReceiptAtom.reportRead();
    return super.goodsReceipt;
  }

  @override
  set goodsReceipt(GoodsReceipt? value) {
    _$goodsReceiptAtom.reportWrite(value, super.goodsReceipt, () {
      super.goodsReceipt = value;
    });
  }

  late final _$postNewReceiptAsyncAction =
      AsyncAction('_AddGoodsReceiptStore.postNewReceipt', context: context);

  @override
  Future<dynamic> postNewReceipt() {
    return _$postNewReceiptAsyncAction.run(() => super.postNewReceipt());
  }

  @override
  String toString() {
    return '''
postGoodsReceipt: ${postGoodsReceipt},
goodsReceipt: ${goodsReceipt}
    ''';
  }
}
