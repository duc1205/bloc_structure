import 'package:app_user/core/exceptions/data_error.dart';
import 'package:fpdart/fpdart.dart';

abstract class AuthDataSource {
  Future<Either<DataError, bool>> login();
}
