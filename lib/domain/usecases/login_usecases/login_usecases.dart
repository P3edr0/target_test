import 'package:dartz/dartz.dart';
import 'package:target_test/data/repositories/login_repository_implements.dart';
import 'package:target_test/domain/repositories/login_repository.dart';
import 'package:target_test/domain/usecases/login_usecases/login_usecase_exceptions.dart';

class LoginUseCase implements ILoginRepository {
  @override
  Either<ILoginUsecaseExceptions, String> call(
      String username, String password) {
    if (username.isEmpty || password.isEmpty) {
      return Left(EmptyUseCaseException());
    }

    if (username.endsWith(' ')) {
      return Left(UserEndsWithUseCaseException());
    }
    if (password.endsWith(' ')) {
      return Left(PasswordEndsWithUseCaseException());
    }
    if (password.length <= 1) {
      return Left(PasswordSizeUseCaseException());
    }

    return LoginRepositoryImpl().call(username, password);
  }
}
