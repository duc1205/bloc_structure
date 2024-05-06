import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../network/dio_provider.dart';
import '../router/app_router.dart';
import 'injector.config.dart';

final getIt = GetIt.instance;

@InjectableInit(preferRelativeImports: false)
Future<void> configureDependencies() async => getIt.init();

@module
abstract class RegisterModule {
  @preResolve
  Future<SharedPreferences> prefs() => SharedPreferences.getInstance();

  @lazySingleton
  Dio get getDio => DioProvider.dioWithHeaderToken;

  @singleton
  GoRouter get goRoute => goRouter();
}
