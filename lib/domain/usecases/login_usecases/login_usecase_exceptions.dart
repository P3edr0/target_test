abstract class ILoginUsecaseExceptions implements Exception {
  final String message;
  ILoginUsecaseExceptions([this.message = "Falha ao tentar fazer login"]);
}

class EmptyUsernameCaseException extends ILoginUsecaseExceptions {
  @override
  EmptyUsernameCaseException(
      [String message = "O campo nome não pode ser vazio"])
      : super(message);
}

class EmptyUseCaseException extends ILoginUsecaseExceptions {
  @override
  EmptyUseCaseException(
      [String message = "O campo nome e senha não podem ser vazios"])
      : super(message);
}

class UserEndsWithUseCaseException extends ILoginUsecaseExceptions {
  @override
  UserEndsWithUseCaseException(
      [String message = 'O nome de usuário não pode terminar com espaço'])
      : super(message);
}

class PasswordEndsWithUseCaseException extends ILoginUsecaseExceptions {
  @override
  PasswordEndsWithUseCaseException(
      [String message = 'O campo de senha não pode terminar com espaço'])
      : super(message);
}

class PasswordSizeUseCaseException extends ILoginUsecaseExceptions {
  @override
  PasswordSizeUseCaseException(
      [String message = 'O campo de senha não pode ter menos de 2 caracteres'])
      : super(message);
}
