// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:boilerplate/core/stores/error/error_store.dart';
import 'package:boilerplate/domain/entity/receipt/goods_receipt.dart';
import 'package:boilerplate/domain/usecase/receipt/add_receipt_usecase.dart';
import 'package:boilerplate/utils/dio/dio_error_util.dart';
import 'package:mobx/mobx.dart';

part 'add_goods_receipt_store.g.dart';

class AddGoodsReceiptStore = _AddGoodsReceiptStore with _$AddGoodsReceiptStore;

abstract class _AddGoodsReceiptStore with Store {
  _AddGoodsReceiptStore(this._addGoodsReceiptUseCase, this.errorStore);

  //usecases
  final AddGoodsReceiptUseCase _addGoodsReceiptUseCase;

  //store
  final ErrorStore errorStore;

  static ObservableFuture<bool> isPostSuccess = ObservableFuture.value(true);

  @observable
  ObservableFuture<dynamic> postGoodsReceipt =
      ObservableFuture<bool>(_AddGoodsReceiptStore.isPostSuccess);

  @observable
  GoodsReceipt? goodsReceipt;

  final List<String> rnList = [
    'RN-10001',
    'RN-10002',
    'RN-10003',
    'RN-10004',
    'RN-10005',
    'RN-10006',
    'RN-10007',
    'RN-10008',
    'RN-10009',
  ];

  final List<ProductReceiptData> productReceiptDataList = [
    ProductReceiptData(
        receivingNumber: '',
        product: '',
        expectedQc: 3,
        acceptedQc: 0,
        notes: ''),
    ProductReceiptData(
        receivingNumber: '',
        product: '',
        expectedQc: 3,
        acceptedQc: 0,
        notes: ''),
    ProductReceiptData(
        receivingNumber: '',
        product: '',
        expectedQc: 3,
        acceptedQc: 0,
        notes: ''),
    ProductReceiptData(
        receivingNumber: '',
        product: '',
        expectedQc: 3,
        acceptedQc: 0,
        notes: '')
  ];

  @action
  Future postNewReceipt() async {
    final future = _addGoodsReceiptUseCase.call(params: goodsReceipt!);
    postGoodsReceipt = ObservableFuture(future);

    future.then((value) {}).catchError((err) {
      errorStore.errorMessage = DioErrorUtil.handleError(err);
    });
  }
}

class ProductReceiptData {
  String receivingNumber;
  String product;
  int expectedQc;
  int acceptedQc;
  String notes;

  ProductReceiptData({
    required this.receivingNumber,
    required this.product,
    required this.expectedQc,
    required this.acceptedQc,
    required this.notes,
  });

  String toJson() => json.encode(toMap());

  factory ProductReceiptData.fromJson(String source) =>
      ProductReceiptData.fromMap(json.decode(source) as Map<String, dynamic>);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'receivingNumber': receivingNumber,
      'product': product,
      'expectedQc': expectedQc,
      'acceptedQc': acceptedQc,
      'notes': notes,
    };
  }

  factory ProductReceiptData.fromMap(Map<String, dynamic> map) {
    return ProductReceiptData(
      receivingNumber: map['receivingNumber'] as String,
      product: map['product'] as String,
      expectedQc: map['expectedQc'] as int,
      acceptedQc: map['acceptedQc'] as int,
      notes: map['notes'] as String,
    );
  }
}
