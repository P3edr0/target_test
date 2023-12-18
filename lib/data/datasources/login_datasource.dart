import 'package:dartz/dartz.dart';
import 'package:target_test/domain/usecases/login_usecases/login_usecase_exceptions.dart';

abstract class ILoginDatasource {
  Future<Either<ILoginUsecaseExceptions, String>> call(
      String username, String password);
}
