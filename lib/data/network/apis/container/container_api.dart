import 'dart:convert';

import 'package:boilerplate/data/network/rest_client.dart';
import 'package:boilerplate/domain/entity/container/container_data_list.dart';
import 'package:boilerplate/domain/entity/container/container_detail.dart';
import 'package:flutter/services.dart';

import '../../../../core/data/network/dio/dio_client.dart';

class ContainerApi {
  final DioClient _dioClient;

  final RestClient _restClient;

  ContainerApi(this._dioClient, this._restClient);

  Future<ContainerDataList> getContainerList() async {
    try {
      final data =
          await rootBundle.loadString("assets/json/container_list.json");
      final mappedData = jsonDecode(data);
      // _restClient.get(path)
      return ContainerDataList.fromMap(mappedData);
    } catch (e) {
      throw e;
    }
  }

  Future<ContainerDetailModel> getContainerDetail() async {
    try {
      final data =
          await rootBundle.loadString("assets/json/container_detail.json");
      final mappedData = jsonDecode(data);
      // _restClient.get(path)
      return ContainerDetailModel.fromMap(mappedData);
    } catch (e) {
      throw (e);
    }
  }
}
