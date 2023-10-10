// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:boilerplate/core/data/network/dio/dio_client.dart';
import 'package:boilerplate/data/network/constants/endpoints.dart';
import 'package:boilerplate/data/network/rest_client.dart';
import 'package:boilerplate/domain/entity/user/user.dart';
import 'package:boilerplate/domain/usecase/user/login_usecase.dart';
import 'package:dio/dio.dart';

class UserApi {
  final DioClient _dioClient;

  final RestClient _restClient;

  UserApi(
    this._dioClient,
    this._restClient,
  );

  final String _loginUrl = Endpoints.loginUrl;

  Future<UserInfoResponse> login(LoginParams params) async {
    late UserInfoResponse userRes;

    await _dioClient.postData(_loginUrl, params.toMap()).then((res) {
      if (res.statusCode == 200) {
        userRes = UserInfoResponse.fromJson(res.data);
        print('from api: ${userRes.data!.accessToken}');
        // _dioClient.dio.options.headers
        //     .addAll({'Authorization': 'Bearer ${userRes.data!.accessToken}'});
      } else {
        var message = res.data['message'];
        throw DioException(
          message: message,
          response: res.data,
          requestOptions: RequestOptions(),
        );
      }
    });

    return userRes;
  }
}
