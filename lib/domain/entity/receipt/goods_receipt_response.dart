import 'dart:convert';

import 'package:boilerplate/domain/entity/receipt/goods_receipt.dart';

GoodsReceiptResponse goodsReceiptResponseFromJson(String str) =>
    GoodsReceiptResponse.fromJson(json.decode(str));

String goodsReceiptResponseToJson(GoodsReceiptResponse data) =>
    json.encode(data.toJson());

class GoodsReceiptResponse {
  String message;
  int status;
  GoodsReceiptData goodsData;

  GoodsReceiptResponse({
    required this.message,
    required this.status,
    required this.goodsData,
  });

  factory GoodsReceiptResponse.fromJson(Map<String, dynamic> json) =>
      GoodsReceiptResponse(
        message: json["message"],
        status: json["status"],
        goodsData: GoodsReceiptData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
        "data": goodsData.toJson(),
      };
}

class GoodsReceiptData {
  List<GoodsReceipt> content;
  Pagination pagination;

  GoodsReceiptData({
    required this.content,
    required this.pagination,
  });

  factory GoodsReceiptData.fromJson(Map<String, dynamic> json) =>
      GoodsReceiptData(
        content: List<GoodsReceipt>.from(
            json["content"].map((x) => GoodsReceipt.fromJson(x))),
        pagination: Pagination.fromJson(json["pagination"]),
      );

  Map<String, dynamic> toJson() => {
        "content": List<dynamic>.from(content.map((x) => x.toJson())),
        "pagination": pagination.toJson(),
      };
}
