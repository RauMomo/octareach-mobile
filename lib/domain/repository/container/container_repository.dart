import 'package:boilerplate/domain/entity/container/container_data_list.dart';
import 'package:boilerplate/domain/entity/container/container_detail.dart';
import 'package:boilerplate/domain/entity/upcoming/upcoming_container_list.dart';

abstract class ContainerRepository {
  Future<ContainerListData> getContainerList();

  Future<ContainerDetailModel> getContainerDetail();

  Future<UpcomingContainerList> getUpcomingContainerList();
}
