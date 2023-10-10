import 'package:boilerplate/domain/entity/container/container_data_list.dart';
import 'package:boilerplate/domain/entity/container/container_detail.dart';

abstract class ContainerRepository {
  Future<ContainerDataList> getContainerList();

  Future<ContainerDetailModel> getContainerDetail();
}
