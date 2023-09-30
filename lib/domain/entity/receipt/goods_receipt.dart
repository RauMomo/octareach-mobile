import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class GoodsReceipt {
  String? markingCode;
  String? receivingNumber;
  String? productTitle;
  String? containerNumber;
  String? dateTime;
  String? notes;
  int? quantity;
  int? id;

  GoodsReceipt(
      {this.markingCode,
      this.receivingNumber,
      this.productTitle,
      this.containerNumber,
      this.dateTime,
      this.notes,
      this.quantity,
      this.id});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'markingCode': markingCode,
      'receivingNumber': receivingNumber,
      'productTitle': productTitle,
      'containerNumber': containerNumber,
      'dateTime': dateTime,
      'notes': notes,
      'quantity': quantity,
      'id': id
    };
  }

  factory GoodsReceipt.fromMap(Map<String, dynamic> map) {
    return GoodsReceipt(
      markingCode:
          map['markingCode'] != null ? map['markingCode'] as String : null,
      receivingNumber: map['receivingNumber'] != null
          ? map['receivingNumber'] as String
          : null,
      productTitle:
          map['productTitle'] != null ? map['productTitle'] as String : null,
      containerNumber: map['containerNumber'] != null
          ? map['containerNumber'] as String
          : null,
      dateTime: map['dateTime'] != null ? map['dateTime'] as String : null,
      notes: map['notes'] != null ? map['notes'] as String : null,
      quantity: map['quantity'] != null ? map['quantity'] as int : null,
      id: map['id'] != null ? map['id'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory GoodsReceipt.fromJson(String source) =>
      GoodsReceipt.fromMap(json.decode(source) as Map<String, dynamic>);
}
