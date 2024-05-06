import 'package:app_user/core/core.dart';

import 'package:fpdart/fpdart.dart';

abstract class AuthRepository {
  Future<Either<DataError, bool>> login();
}
