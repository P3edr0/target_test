import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:target_test/domain/usecases/login_usecase_exceptions.dart';

abstract class ILoginRepository {
  Either<ILoginUsecaseExceptions, StatefulWidget> call(
      String username, String password);
}
