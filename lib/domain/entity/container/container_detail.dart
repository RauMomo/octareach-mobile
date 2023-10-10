// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:boilerplate/domain/entity/receipt/goods_receipt.dart';

class ContainerDetailModel {
  String? name;
  List<GoodsReceipt>? receiptList;

  ContainerDetailModel({required this.name, required this.receiptList});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'receiptList': receiptList!.map((x) => x.toJson()).toList(),
    };
  }

  factory ContainerDetailModel.fromMap(Map<String, dynamic> map) {
    return ContainerDetailModel(
      name: map['name'] as String,
      receiptList: List<GoodsReceipt>.from(
        (map['receiptList'] as List).map<GoodsReceipt>(
          (x) => GoodsReceipt.fromJson(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory ContainerDetailModel.fromJson(String source) =>
      ContainerDetailModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
