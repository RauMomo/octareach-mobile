// ignore_for_file: public_member_api_docs, sort_constructors_first

class GoodsReceipt {
  String id;
  DateTime dateCn;
  DateTime dateId;
  DateTime createdAt;
  DateTime updatedAt;
  String createdBy;
  String updatedBy;
  String receivingPrefixId;
  String markingPrefixId;
  String receivingNumber;
  String markingNumber;
  String deliveryOrder;
  MarkingPrefix receivingPrefix;
  MarkingPrefix markingPrefix;
  List<Product> product;
  History history;
  dynamic invoiceDetail;

  GoodsReceipt({
    required this.id,
    required this.dateCn,
    required this.dateId,
    required this.createdAt,
    required this.updatedAt,
    required this.createdBy,
    required this.updatedBy,
    required this.receivingPrefixId,
    required this.markingPrefixId,
    required this.receivingNumber,
    required this.markingNumber,
    required this.deliveryOrder,
    required this.receivingPrefix,
    required this.markingPrefix,
    required this.product,
    required this.history,
    required this.invoiceDetail,
  });

  factory GoodsReceipt.fromJson(Map<String, dynamic> json) => GoodsReceipt(
        id: json["id"],
        dateCn: DateTime.parse(json["date_cn"]),
        dateId: DateTime.parse(json["date_id"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        receivingPrefixId: json["receiving_prefix_id"],
        markingPrefixId: json["marking_prefix_id"],
        receivingNumber: json["receiving_number"],
        markingNumber: json["marking_number"],
        deliveryOrder: json["delivery_order"],
        receivingPrefix: MarkingPrefix.fromJson(json["receiving_prefix"]),
        markingPrefix: MarkingPrefix.fromJson(json["marking_prefix"]),
        product:
            List<Product>.from(json["product"].map((x) => Product.fromJson(x))),
        history: History.fromJson(json["history"]),
        invoiceDetail: json["invoice_detail"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "date_cn": dateCn.toIso8601String(),
        "date_id": dateId.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "created_by": createdBy,
        "updated_by": updatedBy,
        "receiving_prefix_id": receivingPrefixId,
        "marking_prefix_id": markingPrefixId,
        "receiving_number": receivingNumber,
        "marking_number": markingNumber,
        "delivery_order": deliveryOrder,
        "receiving_prefix": receivingPrefix.toJson(),
        "marking_prefix": markingPrefix.toJson(),
        "product": List<dynamic>.from(product.map((x) => x.toJson())),
        "history": history.toJson(),
        "invoice_detail": invoiceDetail,
      };
}

class Packing {
  String id;
  DateTime stuffingDate;
  DateTime createdAt;
  DateTime updatedAt;
  String createdBy;
  String updatedBy;
  String packingListId;
  String containerNoConsortiom;
  String containerNoInternal;
  DateTime estimationDateCn;
  DateTime estimationDateId;
  dynamic dateCn;
  dynamic dateId;
  dynamic attach;
  List<History> history;
  List<dynamic> media;

  Packing({
    required this.id,
    required this.stuffingDate,
    required this.createdAt,
    required this.updatedAt,
    required this.createdBy,
    required this.updatedBy,
    required this.packingListId,
    required this.containerNoConsortiom,
    required this.containerNoInternal,
    required this.estimationDateCn,
    required this.estimationDateId,
    required this.dateCn,
    required this.dateId,
    required this.attach,
    required this.history,
    required this.media,
  });

  factory Packing.fromJson(Map<String, dynamic> json) => Packing(
        id: json["id"],
        stuffingDate: DateTime.parse(json["stuffing_date"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        packingListId: json["packing_list_id"],
        containerNoConsortiom: json["container_no_consortiom"],
        containerNoInternal: json["container_no_internal"],
        estimationDateCn: DateTime.parse(json["estimation_date_cn"]),
        estimationDateId: DateTime.parse(json["estimation_date_id"]),
        dateCn: json["date_cn"],
        dateId: json["date_id"],
        attach: json["attach"],
        history:
            List<History>.from(json["history"].map((x) => History.fromJson(x))),
        media: List<dynamic>.from(json["media"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "stuffing_date": stuffingDate.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "created_by": createdBy,
        "updated_by": updatedBy,
        "packing_list_id": packingListId,
        "container_no_consortiom": containerNoConsortiom,
        "container_no_internal": containerNoInternal,
        "estimation_date_cn":
            "${estimationDateCn.year.toString().padLeft(4, '0')}-${estimationDateCn.month.toString().padLeft(2, '0')}-${estimationDateCn.day.toString().padLeft(2, '0')}",
        "estimation_date_id":
            "${estimationDateId.year.toString().padLeft(4, '0')}-${estimationDateId.month.toString().padLeft(2, '0')}-${estimationDateId.day.toString().padLeft(2, '0')}",
        "date_cn": dateCn,
        "date_id": dateId,
        "attach": attach,
        "history": List<dynamic>.from(history.map((x) => x.toJson())),
        "media": List<dynamic>.from(media.map((x) => x)),
      };
}

class History {
  String id;
  String receiveId;
  String packingId;
  String status;
  List<Activity> activities;
  DateTime createdAt;
  DateTime updatedAt;
  String createdBy;
  String updatedBy;
  String packingStatus;
  Packing? packing;

  History({
    required this.id,
    required this.receiveId,
    required this.packingId,
    required this.status,
    required this.activities,
    required this.createdAt,
    required this.updatedAt,
    required this.createdBy,
    required this.updatedBy,
    required this.packingStatus,
    this.packing,
  });

  factory History.fromJson(Map<String, dynamic> json) => History(
        id: json["id"],
        receiveId: json["receive_id"],
        packingId: json["packing_id"],
        status: json["status"],
        activities: List<Activity>.from(
            json["activities"].map((x) => Activity.fromJson(x))),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        packingStatus: json["packing_status"],
        packing:
            json["packing"] == null ? null : Packing.fromJson(json["packing"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "receive_id": receiveId,
        "packing_id": packingId,
        "status": status,
        "activities": List<dynamic>.from(activities.map((x) => x.toJson())),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "created_by": createdBy,
        "updated_by": updatedBy,
        "packing_status": packingStatus,
        "packing": packing?.toJson(),
      };
}

class Activity {
  DateTime date;
  String label;
  String status;

  Activity({
    required this.date,
    required this.label,
    required this.status,
  });

  factory Activity.fromJson(Map<String, dynamic> json) => Activity(
        date: DateTime.parse(json["date"]),
        label: json["label"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "date": date.toIso8601String(),
        "label": label,
        "status": status,
      };
}

class MarkingPrefix {
  String id;
  String name;
  DateTime createdAt;
  DateTime updatedAt;
  String createdBy;
  String updatedBy;
  String? via;
  int? priceMin;
  String? productCategoryId;

  MarkingPrefix({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    required this.createdBy,
    required this.updatedBy,
    this.via,
    this.priceMin,
    this.productCategoryId,
  });

  factory MarkingPrefix.fromJson(Map<String, dynamic> json) => MarkingPrefix(
        id: json["id"],
        name: json["name"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        via: json["via"],
        priceMin: json["price_min"],
        productCategoryId: json["product_category_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "created_by": createdBy,
        "updated_by": updatedBy,
        "via": via,
        "price_min": priceMin,
        "product_category_id": productCategoryId,
      };
}

class Product {
  String id;
  String name;
  String receiveId;
  String productCategoryId;
  String productTypeId;
  int qc;
  int length;
  int width;
  int height;
  int volume;
  int weight;
  int overweight;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  String createdBy;
  String updatedBy;
  MarkingPrefix productCategory;
  MarkingPrefix productType;

  Product({
    required this.id,
    required this.name,
    required this.receiveId,
    required this.productCategoryId,
    required this.productTypeId,
    required this.qc,
    required this.length,
    required this.width,
    required this.height,
    required this.volume,
    required this.weight,
    required this.overweight,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.createdBy,
    required this.updatedBy,
    required this.productCategory,
    required this.productType,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        receiveId: json["receive_id"],
        productCategoryId: json["product_category_id"],
        productTypeId: json["product_type_id"],
        qc: json["qc"],
        length: json["length"],
        width: json["width"],
        height: json["height"],
        volume: json["volume"],
        weight: json["weight"],
        overweight: json["overweight"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        productCategory: MarkingPrefix.fromJson(json["product_category"]),
        productType: MarkingPrefix.fromJson(json["product_type"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "receive_id": receiveId,
        "product_category_id": productCategoryId,
        "product_type_id": productTypeId,
        "qc": qc,
        "length": length,
        "width": width,
        "height": height,
        "volume": volume,
        "weight": weight,
        "overweight": overweight,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "created_by": createdBy,
        "updated_by": updatedBy,
        "product_category": productCategory.toJson(),
        "product_type": productType.toJson(),
      };
}

class Pagination {
  int total;
  int lastPage;
  int perPage;
  int currentPage;

  Pagination({
    required this.total,
    required this.lastPage,
    required this.perPage,
    required this.currentPage,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        total: json["total"],
        lastPage: json["last_page"],
        perPage: json["per_page"],
        currentPage: json["current_page"],
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "last_page": lastPage,
        "per_page": perPage,
        "current_page": currentPage,
      };
}
