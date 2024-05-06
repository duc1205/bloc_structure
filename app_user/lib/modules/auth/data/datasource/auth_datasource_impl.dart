import 'package:app_user/core/exceptions/data_error.dart';
import 'package:app_user/modules/auth/data/datasource/auth_datasource.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AuthDataSourceImpl extends AuthDataSource {
  @override
  Future<Either<DataError, bool>> login() {
    // TODO: implement login
    throw UnimplementedError();
  }
}
