import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/core.dart';
import 'auth_datasource.dart';

@lazySingleton
class AuthDataSourceImpl extends AuthDataSource {
  @override
  Future<Either<DataError, bool>> login() {
    // TODO: implement login
    throw UnimplementedError();
  }
}
