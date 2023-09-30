import 'dart:async';
import 'dart:convert';

import 'package:boilerplate/core/data/network/dio/dio_client.dart';
import 'package:boilerplate/data/network/rest_client.dart';
import 'package:boilerplate/domain/entity/receipt/goods_receipt_list.dart';
import 'package:flutter/services.dart';

class GoodsReceiptApi {
  // dio instance
  final DioClient _dioClient;

  // rest-client instance
  final RestClient _restClient;

  // injecting dio instance
  GoodsReceiptApi(this._dioClient, this._restClient);

  /// Returns list of post in response
  Future<GoodsReceiptList> getPosts() async {
    try {
      // final res = await _dioClient.dio.get(Endpoints.getPosts);
      final data =
          await rootBundle.loadString("assets/json/goods_receipt.json");
      return GoodsReceiptList.fromJson(jsonDecode(data));
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  /// sample api call with default rest client
//  Future<PostsList> getPosts() {
//
//    return _restClient
//        .get(Endpoints.getPosts)
//        .then((dynamic res) => PostsList.fromJson(res))
//        .catchError((error) => throw NetworkException(message: error));
//  }
}
