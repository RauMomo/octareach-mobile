// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'container_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ContainerStore on _ContainerStore, Store {
  Computed<bool>? _$loadingComputed;

  @override
  bool get loading => (_$loadingComputed ??=
          Computed<bool>(() => super.loading, name: '_ContainerStore.loading'))
      .value;

  late final _$containerDataListAtom =
      Atom(name: '_ContainerStore.containerDataList', context: context);

  @override
  ContainerListData? get containerDataList {
    _$containerDataListAtom.reportRead();
    return super.containerDataList;
  }

  @override
  set containerDataList(ContainerListData? value) {
    _$containerDataListAtom.reportWrite(value, super.containerDataList, () {
      super.containerDataList = value;
    });
  }

  late final _$containerDataUiModelAtom =
      Atom(name: '_ContainerStore.containerDataUiModel', context: context);

  @override
  List<ContainerDataUiModel?> get containerDataUiModel {
    _$containerDataUiModelAtom.reportRead();
    return super.containerDataUiModel;
  }

  @override
  set containerDataUiModel(List<ContainerDataUiModel?> value) {
    _$containerDataUiModelAtom.reportWrite(value, super.containerDataUiModel,
        () {
      super.containerDataUiModel = value;
    });
  }

  late final _$containerDetailModelAtom =
      Atom(name: '_ContainerStore.containerDetailModel', context: context);

  @override
  ContainerDetailModel? get containerDetailModel {
    _$containerDetailModelAtom.reportRead();
    return super.containerDetailModel;
  }

  @override
  set containerDetailModel(ContainerDetailModel? value) {
    _$containerDetailModelAtom.reportWrite(value, super.containerDetailModel,
        () {
      super.containerDetailModel = value;
    });
  }

  late final _$fetchContainerFutureAtom =
      Atom(name: '_ContainerStore.fetchContainerFuture', context: context);

  @override
  ObservableFuture<dynamic> get fetchContainerFuture {
    _$fetchContainerFutureAtom.reportRead();
    return super.fetchContainerFuture;
  }

  @override
  set fetchContainerFuture(ObservableFuture<dynamic> value) {
    _$fetchContainerFutureAtom.reportWrite(value, super.fetchContainerFuture,
        () {
      super.fetchContainerFuture = value;
    });
  }

  @override
  String toString() {
    return '''
containerDataList: ${containerDataList},
containerDataUiModel: ${containerDataUiModel},
containerDetailModel: ${containerDetailModel},
fetchContainerFuture: ${fetchContainerFuture},
loading: ${loading}
    ''';
  }
}
