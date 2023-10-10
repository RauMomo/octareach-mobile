// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:boilerplate/domain/entity/container/container_data.dart';

class ContainerDataList {
  List<ContainerData>? containerList;

  ContainerDataList({required this.containerList});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'containerList': containerList!.map((x) => x.toMap()).toList(),
    };
  }

  factory ContainerDataList.fromMap(Map<String, dynamic> map) {
    return ContainerDataList(
      containerList: List<ContainerData>.from(
        (map['containerList'] as List).map<ContainerData>(
          (x) => ContainerData.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory ContainerDataList.fromJson(String source) =>
      ContainerDataList.fromMap(json.decode(source) as Map<String, dynamic>);
}
