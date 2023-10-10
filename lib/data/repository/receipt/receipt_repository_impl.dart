import 'dart:async';

import 'package:boilerplate/data/local/constants/db_constants.dart';
import 'package:boilerplate/data/local/datasources/receipt/receipt_datasource.dart';
import 'package:boilerplate/data/network/apis/receipt/receipt_api.dart';
import 'package:boilerplate/domain/entity/receipt/goods_receipt.dart';
import 'package:boilerplate/domain/entity/receipt/goods_receipt_response.dart';
import 'package:boilerplate/domain/repository/receipt/receipt_repository.dart';
import 'package:sembast/sembast.dart';

class GoodsReceiptRepositoryImpl extends GoodsReceiptRepository {
  // data source object
  final GoodsReceiptDataSource _receiptDataSource;

  // api objects
  final GoodsReceiptApi _receiptApi;

  // constructor
  GoodsReceiptRepositoryImpl(this._receiptApi, this._receiptDataSource);

  // Post: ---------------------------------------------------------------------
  @override
  Future<GoodsReceiptData> getGoodsReceipt() async {
    // check to see if posts are present in database, then fetch from database
    // else make a network call to get all posts, store them into database for
    // later use
    return await _receiptApi.getPosts().then((receiptData) {
      receiptData.content.forEach((post) {
        _receiptDataSource.insert(post);
      });

      return receiptData;
    }).catchError((error) => throw error);
  }

  @override
  Future<List<GoodsReceipt>> findPostById(int id) {
    //creating filter
    List<Filter> filters = [];

    //check to see if dataLogsType is not null
    Filter dataLogTypeFilter = Filter.equals(DBConstants.FIELD_ID, id);
    filters.add(dataLogTypeFilter);

    //making db call
    return _receiptDataSource
        .getAllSortedByFilter(filters: filters)
        .then((posts) => posts)
        .catchError((error) => throw error);
  }

  @override
  Future<int> insert(GoodsReceipt good) => _receiptDataSource
      .insert(good)
      .then((id) => id)
      .catchError((error) => throw error);

  @override
  Future<int> update(GoodsReceipt good) => _receiptDataSource
      .update(good)
      .then((id) => id)
      .catchError((error) => throw error);

  @override
  Future<int> delete(GoodsReceipt good) => _receiptDataSource
      .update(good)
      .then((id) => id)
      .catchError((error) => throw error);
}
