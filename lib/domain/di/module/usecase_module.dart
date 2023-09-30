import 'dart:async';

import 'package:boilerplate/domain/repository/receipt/receipt_repository.dart';
import 'package:boilerplate/domain/repository/user/user_repository.dart';
import 'package:boilerplate/domain/usecase/receipt/delete_receipt_usecase.dart';
import 'package:boilerplate/domain/usecase/receipt/find_receipt_by_id_usecase.dart';
import 'package:boilerplate/domain/usecase/receipt/get_receipt_usecase.dart';
import 'package:boilerplate/domain/usecase/receipt/insert_receipt_usecase.dart';
import 'package:boilerplate/domain/usecase/receipt/update_receipt_usecase.dart';
import 'package:boilerplate/domain/usecase/user/is_logged_in_usecase.dart';
import 'package:boilerplate/domain/usecase/user/login_usecase.dart';
import 'package:boilerplate/domain/usecase/user/save_login_in_status_usecase.dart';

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
    getIt.registerSingleton<LoginUseCase>(
      LoginUseCase(getIt<UserRepository>()),
    );

    // post:--------------------------------------------------------------------
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
  }
}
