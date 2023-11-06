// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:boilerplate/domain/usecase/profile/logout_account_usecase.dart';
import 'package:mobx/mobx.dart';

part 'profile_store.g.dart';

class ProfileStore = _ProfileStore with _$ProfileStore;

abstract class _ProfileStore with Store {
  _ProfileStore(this._logoutAccountUseCase);

  final LogoutAccountUseCase _logoutAccountUseCase;
  //observable
  final Profile profile = Profile(
    email: 'rizalheryadi@gmail.com',
    address: 'Jalan Legoso No.72',
    phoneNumber: '081275673856',
  );
  //computed

  //setter & getter

  static ObservableFuture<void> logoutFuture =
      ObservableFuture<void>.value(null);

  //method
  Future<void> logoutAccount() async {
    final future = _logoutAccountUseCase.call(params: null);
    logoutFuture = ObservableFuture(future);

    logoutFuture
        .then(
          (value) {},
        )
        .catchError(
          (err) => throw Exception('Terjadi masalah'),
        );
  }
}

class Profile {
  final String email;
  final String address;
  final String phoneNumber;

  Profile(
      {required this.email, required this.address, required this.phoneNumber});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': 'email',
      'address': address,
      'phoneNumber': phoneNumber,
    };
  }

  factory Profile.fromMap(Map<String, dynamic> map) {
    return Profile(
      email: map['email'] as String,
      address: map['address'] as String,
      phoneNumber: map['phoneNumber'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Profile.fromJson(String source) =>
      Profile.fromMap(json.decode(source) as Map<String, dynamic>);
}
