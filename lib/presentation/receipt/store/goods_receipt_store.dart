import 'package:boilerplate/core/stores/error/error_store.dart';
import 'package:boilerplate/domain/entity/receipt/goods_receipt_response.dart';
import 'package:boilerplate/utils/dio/dio_error_util.dart';
import 'package:mobx/mobx.dart';

import '../../../domain/usecase/receipt/get_receipt_usecase.dart';

part 'goods_receipt_store.g.dart';

class GoodsReceiptStore = _GoodsReceiptStore with _$GoodsReceiptStore;

abstract class _GoodsReceiptStore with Store {
  //constructor:---------------------------------------------------------------
  _GoodsReceiptStore(this._getGoodsReceiptUseCase, this.errorStore);

  // use cases:-----------------------------------------------------------------
  final GetGoodsReceiptUseCase _getGoodsReceiptUseCase;

  // stores:--------------------------------------------------------------------
  // store for handling errors
  final ErrorStore errorStore;

  // store variables:-----------------------------------------------------------
  static ObservableFuture<GoodsReceiptData?> emptyReceiptResponse =
      ObservableFuture.value(null);

  @observable
  ObservableFuture<dynamic> fetchPostsFuture =
      ObservableFuture<GoodsReceiptData?>(emptyReceiptResponse);

  @observable
  GoodsReceiptData? goodsReceiptData;

  @observable
  bool success = false;

  @computed
  bool get loading => fetchPostsFuture.status == FutureStatus.pending;

  // pagination state
  @observable
  // bool hasNextPage =

  // actions:-------------------------------------------------------------------
  @action
  Future getPosts() async {
    final future = _getGoodsReceiptUseCase.call(params: null);
    fetchPostsFuture = ObservableFuture(future);

    future.then((goodsReceiptList) {
      this.goodsReceiptData = goodsReceiptList;
    }).catchError((error) {
      errorStore.errorMessage = DioErrorUtil.handleError(error);
    });
  }
}
