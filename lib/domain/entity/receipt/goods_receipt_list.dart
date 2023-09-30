import 'package:boilerplate/domain/entity/receipt/goods_receipt.dart';

class GoodsReceiptList {
  final List<GoodsReceipt>? goods;

  GoodsReceiptList({
    this.goods,
  });

  factory GoodsReceiptList.fromJson(List<dynamic> json) {
    List<GoodsReceipt> goods = <GoodsReceipt>[];
    goods = json.map((post) => GoodsReceipt.fromMap(post)).toList();

    return GoodsReceiptList(goods: goods);
  }
}
