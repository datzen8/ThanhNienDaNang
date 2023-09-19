   import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:zen8app/utils/utils.dart';
import 'package:zen8app/models/models.dart';
import 'package:zen8app/core/core.dart';

class DefaultAuthenticator extends Authenticator<Credential> {
  @override
  void applyCredential(Credential credential, RequestOptions options) {
    options.headers["Authorization"] = "JWT ${credential.token}";
  }

  @override
  bool shouldRefreshCredential(DioException error) {
    return error.response?.statusCode == 401 &&
        error.requestOptions.retryCount == 0;
  }

  @override
  bool isRequestAuthenticatedWithCredential(
      RequestOptions options, Credential credential) {
    final requestAuthorizationHeader = options.headers["Authorization"];
    final currentAuthorizationHeader = "JWT ${credential.token}";
    return requestAuthorizationHeader == currentAuthorizationHeader;
  }

  @override
  Future<Credential> refreshCredential(Credential oldCredential, Dio client) {
    return client.post("/account/user/refresh-token/" ,data: {
      "refresh_token":oldCredential.refreshToken
    }).then((response) {
      final credential = Credential(refreshToken:  oldCredential.refreshToken ,token:  response.data["token"]);
      DI
          .resolve<LocalStore>()
          .setValue(LocalStoreKey.credential, jsonEncode(credential));
      return credential;
    }).catchError((e) {
      EventBus.shared
          .post(event: AppEvent.forceLogout, data: "can not refresh token");
    });
  }
}
