import 'package:boilerplate/data/local/constants/db_constants.dart';
import 'package:boilerplate/data/local/datasources/container/container_datasource.dart';
import 'package:boilerplate/data/network/apis/container/container_api.dart';
import 'package:boilerplate/domain/entity/container/container_data.dart';
import 'package:boilerplate/domain/entity/container/container_data_list.dart';
import 'package:boilerplate/domain/entity/container/container_detail.dart';
import 'package:boilerplate/domain/repository/container/container_repository.dart';
import 'package:sembast/sembast.dart';

class ContainerRepositoryImpl extends ContainerRepository {
  //data source api
  final ContainerDataSource _containerDataSource;

  //network api
  final ContainerApi _containerApi;

  ContainerRepositoryImpl(this._containerDataSource, this._containerApi);

  // ContainerRepository surface => fetch main data
  @override
  Future<ContainerDataList> getContainerList() async {
    return await _containerApi.getContainerList().then((value) {
      value.containerList?.forEach((element) {
        _containerDataSource.insert(element);
      });

      return value;
    }).catchError((error) => throw error);
  }

  @override
  Future<ContainerDetailModel> getContainerDetail() async {
    return await _containerApi
        .getContainerDetail()
        .then((value) => value)
        .catchError((err) => throw err);
  }

  Future<List<ContainerData>> findContainerById(int id) {
    List<Filter> filters = [];
    Filter idTypeFilter = Filter.equals(DBConstants.FIELD_ID, id);
    filters.add(idTypeFilter);

    return _containerDataSource
        .getAllSortedByFilter(filters: filters)
        .then((value) => value)
        .catchError((error) => throw error);
  }

  @override
  Future<int> update(ContainerData data) => _containerDataSource
      .update(data)
      .then((id) => id)
      .catchError((error) => throw error);

  @override
  Future<int> delete(ContainerData data) => _containerDataSource
      .delete(data)
      .then((id) => id)
      .catchError((error) => throw error);
}
