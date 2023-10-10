// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:boilerplate/core/stores/error/error_store.dart';
import 'package:boilerplate/domain/entity/container/container_data_list.dart';
import 'package:boilerplate/domain/entity/container/container_detail.dart';
import 'package:boilerplate/domain/usecase/container/get_container_detail_usecase.dart';
import 'package:boilerplate/domain/usecase/container/get_container_usecase.dart';
import 'package:boilerplate/utils/dio/dio_error_util.dart';
import 'package:mobx/mobx.dart';

part 'container_store.g.dart';

class ContainerStore = _ContainerStore with _$ContainerStore;

abstract class _ContainerStore with Store {
  _ContainerStore(
    this._getContainerUseCase,
    this._getContainerDetailUseCase,
    this.errorStore,
  );
  // //repo instance
  // final ContainerRepository _repository;

  //use cases
  final GetContainerUseCase _getContainerUseCase;

  final GetContainerDetailUseCase _getContainerDetailUseCase;

  //store for handling errors
  final ErrorStore errorStore;

  //store variables
  @observable
  ContainerDataList? containerDataList;

  @observable
  ContainerDetailModel? containerDetailModel;

  static ObservableFuture<ContainerDataList?> emptyContainerResponse =
      ObservableFuture.value(null);

  @observable
  ObservableFuture<dynamic> fetchContainerFuture =
      ObservableFuture<ContainerDataList?>(emptyContainerResponse);

  @computed
  bool get loading => fetchContainerFuture.status == FutureStatus.pending;

  //actions
  Future getContainerList() async {
    final future = _getContainerUseCase.call(params: null);
    fetchContainerFuture = ObservableFuture(future);

    future.then((containerDataList) {
      this.containerDataList = containerDataList;
    }).catchError((err) {
      errorStore.errorMessage = DioErrorUtil.handleError(err);
    });
  }

  Future getContainerDetail() async {
    final future = _getContainerDetailUseCase.call(params: null);
    fetchContainerFuture = ObservableFuture(future);

    future.then((containerDetail) {
      this.containerDetailModel = containerDetail;
      print(containerDetailModel!.receiptList!.length.toString());
    }).catchError((err) {
      print(err);
      errorStore.errorMessage = DioErrorUtil.handleError(err);
    });
  }
}
