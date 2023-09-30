import 'dart:async';

import 'package:boilerplate/domain/entity/receipt/goods_receipt.dart';
import 'package:boilerplate/domain/entity/receipt/goods_receipt_list.dart';

abstract class GoodsReceiptRepository {
  Future<GoodsReceiptList> getGoodsReceipt();

  Future<List<GoodsReceipt>> findPostById(int id);

  Future<int> insert(GoodsReceipt post);

  Future<int> update(GoodsReceipt post);

  Future<int> delete(GoodsReceipt post);
}
