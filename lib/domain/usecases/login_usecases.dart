import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:target_test/domain/repositories/login_repository.dart';
import 'package:target_test/domain/usecases/login_usecase_exceptions.dart';
import 'package:target_test/presentation/ui/pages/info_page/info_page.dart';

class LoginUseCase implements ILoginRepository {
  @override
  Either<ILoginUsecaseExceptions, StatefulWidget> call(
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

    return const Right(InfoPage());
  }
}
