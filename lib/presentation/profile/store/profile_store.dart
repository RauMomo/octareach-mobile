// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:boilerplate/domain/usecase/profile/logout_account_usecase.dart';
import 'package:mobx/mobx.dart';

part 'profile_store.g.dart';

class ProfileStore = _ProfileStore with _$ProfileStore;

abstract class _ProfileStore with Store {
  _ProfileStore(this._logoutAccountUseCase);

  final LogoutAccountUseCase _logoutAccountUseCase;
  //observable

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
