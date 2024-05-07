// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:app_user/bindings/injector.dart' as _i14;
import 'package:app_user/core/storage_manager/local_storage/preference_manager.dart'
    as _i7;
import 'package:app_user/core/storage_manager/local_storage/preference_manager_impl.dart'
    as _i8;
import 'package:app_user/modules/auth/data/datasource/auth_datasource.dart'
    as _i9;
import 'package:app_user/modules/auth/data/datasource/auth_datasource_impl.dart'
    as _i10;
import 'package:app_user/modules/auth/data/repositories/auth_remote_repository_impl.dart'
    as _i12;
import 'package:app_user/modules/auth/domain/repositories/auth_repository.dart'
    as _i11;
import 'package:app_user/modules/auth/domain/usecases/login_usecase.dart'
    as _i13;
import 'package:app_user/network/dio_provider.dart' as _i5;
import 'package:dio/dio.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:go_router/go_router.dart' as _i4;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i3;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i3.SharedPreferences>(
      () => registerModule.prefs(),
      preResolve: true,
    );
    gh.singleton<_i4.GoRouter>(() => registerModule.goRoute);
    gh.lazySingleton<_i5.DioProvider>(() => _i5.DioProvider());
    gh.lazySingleton<_i6.Dio>(() => registerModule.getDio);
    gh.lazySingleton<_i7.PreferenceManager>(() =>
        _i8.PreferenceManagerImpl(preferences: gh<_i3.SharedPreferences>()));
    gh.lazySingleton<_i9.AuthDataSource>(
        () => _i10.AuthDataSourceImpl(dio: gh<_i6.Dio>()));
    gh.lazySingleton<_i11.AuthRepository>(() => _i12.AuthRemoteRepositoryImpl(
        authDataSource: gh<_i9.AuthDataSource>()));
    gh.lazySingleton<_i13.LoginUseCase>(
        () => _i13.LoginUseCase(authRepository: gh<_i11.AuthRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i14.RegisterModule {}
