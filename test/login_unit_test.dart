import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:target_test/domain/usecases/login_usecases/login_usecase_exceptions.dart';
import 'package:target_test/domain/usecases/login_usecases/login_usecases.dart';

void main() {
  group('Test Login Usecases', () {
    test('UserEndsWithUseCase', () {
      LoginUseCase loginUseCase = LoginUseCase();
      var result = loginUseCase.call('Pedro ', '23456');

      expect(result, isA<Left<ILoginUsecaseExceptions, String>>());
      result.fold(
        (exception) {
          expect(exception, isA<UserEndsWithUseCaseException>());
        },
        (value) {
          fail('Esperava uma exceção, mas recebeu: $value');
        },
      );
    });
    test('PasswordEndsWithUseCase', () {
      LoginUseCase loginUseCase = LoginUseCase();
      var result = loginUseCase.call('Pedro', '23456 ');

      expect(result, isA<Left<ILoginUsecaseExceptions, String>>());
      result.fold(
        (exception) {
          expect(exception, isA<PasswordEndsWithUseCaseException>());
        },
        (value) {
          fail('Esperava uma exceção, mas recebeu: $value');
        },
      );
    });
    test('EmptyUseCase', () {
      LoginUseCase loginUseCase = LoginUseCase();
      var result = loginUseCase.call('', '23456 ');

      expect(result, isA<Left<ILoginUsecaseExceptions, String>>());
      result.fold(
        (exception) {
          expect(exception, isA<EmptyUseCaseException>());
        },
        (value) {
          fail('Esperava uma exceção, mas recebeu: $value');
        },
      );

      result = loginUseCase.call('Pedro', '');

      expect(result, isA<Left<ILoginUsecaseExceptions, String>>());
      result.fold(
        (exception) {
          expect(exception, isA<EmptyUseCaseException>());
        },
        (value) {
          fail('Esperava uma exceção, mas recebeu: $value');
        },
      );
    });

    test('PasswordSizeUseCase', () {
      LoginUseCase loginUseCase = LoginUseCase();
      var result = loginUseCase.call('Pedro', '5');

      expect(result, isA<Left<ILoginUsecaseExceptions, String>>());
      result.fold(
        (exception) {
          expect(exception, isA<PasswordSizeUseCaseException>());
        },
        (value) {
          fail('Esperava uma exceção, mas recebeu: $value');
        },
      );
    });
  });

  test('Login Sucess', () {
    LoginUseCase loginUseCase = LoginUseCase();
    var result = loginUseCase.call('Pedro', '5758');

    expect(result, isA<Right<ILoginUsecaseExceptions, String>>());
    result.fold(
      (exception) {
        fail('Esperava uma exceção, mas recebeu: $exception');
      },
      (value) {
        expect(value, 'Target Sistemas Token');
      },
    );
  });
}
