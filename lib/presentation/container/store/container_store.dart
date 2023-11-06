// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:boilerplate/core/stores/error/error_store.dart';
import 'package:boilerplate/domain/entity/container/container_data_list.dart';
import 'package:boilerplate/domain/entity/container/container_detail.dart';
import 'package:boilerplate/domain/usecase/container/get_container_detail_usecase.dart';
import 'package:boilerplate/domain/usecase/container/get_container_usecase.dart';
import 'package:boilerplate/utils/conversion/conversion.dart';
import 'package:boilerplate/utils/dio/dio_error_util.dart';
import 'package:dio/dio.dart';
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
  ContainerListData? containerDataList;

  @observable
  List<ContainerDataUiModel?> containerDataUiModel = <ContainerDataUiModel>[];

  @observable
  ContainerDetailModel? containerDetailModel;

  static ObservableFuture<ContainerListData?> emptyContainerResponse =
      ObservableFuture.value(null);

  @observable
  ObservableFuture<dynamic> fetchContainerFuture =
      ObservableFuture<ContainerListData?>(emptyContainerResponse);

  @computed
  bool get loading => fetchContainerFuture.status == FutureStatus.pending;

  //actions
  Future getContainerList() async {
    final future = _getContainerUseCase.call(params: null);
    fetchContainerFuture = ObservableFuture(future);

    future.then((containerDataList) {
      this.containerDataList = containerDataList;
      this.containerDataUiModel = containerDataList.content.map((e) {
        return ContainerDataUiModel(
          containerNumber: e.history!.packing!.containerNoInternal,
          items: e.product!.length,
          quantity: e.history!.packing!.history[0].receivedQc,
          dateTime: formatDateToString(e.createdAt),
        );
      }).toList();

    }).catchError((err) {
      if (err.runtimeType == DioException) {
        errorStore.errorMessage = DioErrorUtil.handleError(err);
      } else if (err.runtimeType == TypeError) {
        errorStore.errorMessage = err.toString();
      }
    });
  }

  Future getContainerDetail() async {
    final future = _getContainerDetailUseCase.call(params: null);
    fetchContainerFuture = ObservableFuture(future);

    future.then((containerDetail) {
      this.containerDetailModel = containerDetail;
    }).catchError((err) {
      print(err);
      errorStore.errorMessage = DioErrorUtil.handleError(err);
    });
  }
}

class ContainerDataUiModel {
  String? containerNumber;
  int? items;
  int? quantity;
  String? dateTime;

  ContainerDataUiModel(
      {required this.containerNumber,
      required this.items,
      required this.quantity,
      required this.dateTime});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'containerNumber': containerNumber,
      'items': items,
      'quantity': quantity,
      'dateTime': dateTime,
    };
  }

  factory ContainerDataUiModel.fromMap(Map<String, dynamic> map) {
    return ContainerDataUiModel(
      containerNumber: map['containerNumber'] as String,
      items: map['items'] as int,
      quantity: map['quantity'] as int,
      dateTime: map['dateTime'] as String,
    );
  }
}
