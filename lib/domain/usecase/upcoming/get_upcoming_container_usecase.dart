import 'dart:async';

import 'package:boilerplate/core/domain/usecase/use_case.dart';
import 'package:boilerplate/domain/entity/upcoming/upcoming_container_list.dart';
import 'package:boilerplate/domain/repository/upcoming/upcoming_container_repository.dart';

class GetUpcomingContainerUseCase extends UseCase<UpcomingContainerList, void> {
  final UpcomingContainerRepository _upcomingContainerRepository;

  GetUpcomingContainerUseCase(this._upcomingContainerRepository);

  @override
  Future<UpcomingContainerList> call({required void params}) {
    return _upcomingContainerRepository.getUpcomingContainerList();
  }
}