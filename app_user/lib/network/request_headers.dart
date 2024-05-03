import 'package:app_user/bindings/injector.dart';
import 'package:app_user/core/constants/storage_key_constants.dart';
import 'package:app_user/core/storage_manager/local_storage/preference_manager.dart';
import 'package:dio/dio.dart';

class RequestHeaderInterceptor extends InterceptorsWrapper {
  final PreferenceManager _preferenceManager = getIt<PreferenceManager>();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    getCustomHeaders().then((customHeaders) {
      options.headers.addAll(customHeaders);
      super.onRequest(options, handler);
    });
  }

  Future<Map<String, String>> getCustomHeaders() async {
    final String accessToken =
        _preferenceManager.getString(StorageKeyConstants.keyAccessToken);

    var customHeaders = {
      'content-type': 'application/json',
    };

    if (accessToken.trim().isNotEmpty) {
      customHeaders.addAll({
        'Authorization': "Bearer $accessToken",
      });
    }

    return customHeaders;
  }
}
