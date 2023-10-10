import 'dart:async';

import 'package:boilerplate/domain/repository/container/container_repository.dart';
import 'package:boilerplate/domain/repository/profile/profile_repository.dart';
import 'package:boilerplate/domain/repository/receipt/receipt_repository.dart';
import 'package:boilerplate/domain/repository/user/user_repository.dart';
import 'package:boilerplate/domain/usecase/container/get_container_detail_usecase.dart';
import 'package:boilerplate/domain/usecase/container/get_container_usecase.dart';
import 'package:boilerplate/domain/usecase/profile/logout_account_usecase.dart';
import 'package:boilerplate/domain/usecase/receipt/delete_receipt_usecase.dart';
import 'package:boilerplate/domain/usecase/receipt/find_receipt_by_id_usecase.dart';
import 'package:boilerplate/domain/usecase/receipt/get_receipt_usecase.dart';
import 'package:boilerplate/domain/usecase/receipt/insert_receipt_usecase.dart';
import 'package:boilerplate/domain/usecase/receipt/update_receipt_usecase.dart';
import 'package:boilerplate/domain/usecase/user/get_login_info_usecase.dart';
import 'package:boilerplate/domain/usecase/user/is_logged_in_usecase.dart';
import 'package:boilerplate/domain/usecase/user/login_usecase.dart';
import 'package:boilerplate/domain/usecase/user/save_access_token_usecase.dart';
import 'package:boilerplate/domain/usecase/user/save_login_in_status_usecase.dart';
import 'package:boilerplate/domain/usecase/user/save_login_info_usecase.dart';
import 'package:boilerplate/domain/usecase/user/save_profile_usecase.dart';

import '../../../di/service_locator.dart';

mixin UseCaseModule {
  static Future<void> configureUseCaseModuleInjection() async {
    // user:--------------------------------------------------------------------
    getIt.registerSingleton<IsLoggedInUseCase>(
      IsLoggedInUseCase(getIt<UserRepository>()),
    );
    getIt.registerSingleton<SaveLoginStatusUseCase>(
      SaveLoginStatusUseCase(getIt<UserRepository>()),
    );
    getIt.registerSingleton<SaveLoginInformationUseCase>(
      SaveLoginInformationUseCase(getIt<UserRepository>()),
    );
    getIt.registerSingleton<LoginUseCase>(
      LoginUseCase(getIt<UserRepository>()),
    );
    getIt.registerSingleton<SaveAccessTokenUseCase>(
      SaveAccessTokenUseCase(userRepository: getIt<UserRepository>()),
    );

    getIt.registerSingleton<SaveProfileUseCase>(
      SaveProfileUseCase(getIt<UserRepository>()),
    );

    getIt.registerSingleton<GetLoginInfoUsecase>(
      GetLoginInfoUsecase(getIt<UserRepository>()),
    );

    // receipt:--------------------------------------------------------------------
    getIt.registerSingleton<GetGoodsReceiptUseCase>(
      GetGoodsReceiptUseCase(getIt<GoodsReceiptRepository>()),
    );
    getIt.registerSingleton<FindReceiptByIdUseCase>(
      FindReceiptByIdUseCase(getIt<GoodsReceiptRepository>()),
    );
    getIt.registerSingleton<InsertGoodsReceiptUseCase>(
      InsertGoodsReceiptUseCase(getIt<GoodsReceiptRepository>()),
    );
    getIt.registerSingleton<UpdateReceiptUseCase>(
      UpdateReceiptUseCase(getIt<GoodsReceiptRepository>()),
    );
    getIt.registerSingleton<DeleteReceiptUseCase>(
      DeleteReceiptUseCase(getIt<GoodsReceiptRepository>()),
    );

    // container:--------------------------------------------------------------------
    getIt.registerSingleton<GetContainerUseCase>(
      GetContainerUseCase(getIt<ContainerRepository>()),
    );

    getIt.registerSingleton<GetContainerDetailUseCase>(
      GetContainerDetailUseCase(getIt<ContainerRepository>()),
    );

    // container:--------------------------------------------------------------------
    getIt.registerSingleton<LogoutAccountUseCase>(
      LogoutAccountUseCase(getIt<ProfileRepository>()),
    );
  }
}
