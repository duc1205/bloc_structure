import 'package:app_user/modules/auth/data/datasource/auth_datasource.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/core.dart';
import '../../domain/repositories/auth_repository.dart';

@LazySingleton(as: AuthRepository)
class AuthRemoteRepositoryImpl implements AuthRepository {
  final AuthDataSource _authDataSource;

  AuthRemoteRepositoryImpl({required AuthDataSource authDataSource})
      : _authDataSource = authDataSource;

  @override
  Future<Either<DataError, bool>> login() async => _authDataSource.login();
}
