import 'package:app_user/core/exceptions/data_error.dart';
import 'package:app_user/modules/auth/domain/repositories/auth_repository.dart';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthRepository)
class AuthRemoteRepositoryImpl implements AuthRepository {
  final Dio _dio;

  AuthRemoteRepositoryImpl({required Dio dio}) : _dio = dio;

  @override
  Future<Either<DataError, bool>> login() async {
    try {
      await _dio.post('https://api.escuelajs.co/api/v1/auth/login', data: {
        "email": "john@mail.com",
        "password": "changeme",
      });
      return const Right(true);
    } catch (_) {
      return Left(DataError());
    }
  }
}
