import 'dart:async';

import 'package:boilerplate/core/domain/usecase/use_case.dart';
import 'package:boilerplate/domain/entity/container/container_detail.dart';
import 'package:boilerplate/domain/repository/container/container_repository.dart';

class GetContainerDetailUseCase extends UseCase<ContainerDetailModel, int> {
  final ContainerRepository _containerRepository;

  GetContainerDetailUseCase(this._containerRepository);

  @override
  Future<ContainerDetailModel> call({required void params}) {
    return _containerRepository.getContainerDetail();
  }
}
