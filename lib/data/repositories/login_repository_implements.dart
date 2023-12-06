import 'package:dartz/dartz.dart';
import 'package:target_test/domain/repositories/login_repository.dart';
import 'package:target_test/domain/usecases/login_usecase_exceptions.dart';

class LoginRepositoryImpl implements ILoginRepository {
  @override
  Either<ILoginUsecaseExceptions, String> call(
      String username, String password) {
    /* 
   Validações do login:
      if(){}
      */
    return const Right('Target Sistemas Token');
  }
}
