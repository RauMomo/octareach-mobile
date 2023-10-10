import 'dart:async';

import 'package:boilerplate/core/data/network/dio/dio_client.dart';
import 'package:boilerplate/data/network/constants/endpoints.dart';
import 'package:boilerplate/data/network/rest_client.dart';
import 'package:boilerplate/data/sharedpref/shared_preference_helper.dart';
import 'package:boilerplate/di/service_locator.dart';
import 'package:boilerplate/domain/entity/receipt/goods_receipt_response.dart';
import 'package:dio/dio.dart';

class GoodsReceiptApi {
  // dio instance
  final DioClient _dioClient;

  // rest-client instance
  final RestClient _restClient;

  // injecting dio instance
  GoodsReceiptApi(this._dioClient, this._restClient);

  final String _receiptUrl = Endpoints.receiptUrl;

  /// Returns list of post in response
  Future<GoodsReceiptData> getPosts() async {
    var token = await getIt<SharedPreferenceHelper>().authToken;
    late GoodsReceiptData postsData;
    await _dioClient.getData(_receiptUrl).then((value) {
      if (value.statusCode == 200) {
        var data = GoodsReceiptResponse.fromJson(value.data);
        postsData = data.goodsData;
      } else {
        var message = value.data['message'];
        print(message);
        throw DioException(
          message: message,
          response: value.data,
          requestOptions: RequestOptions(),
        );
      }
    });

    return postsData;
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
