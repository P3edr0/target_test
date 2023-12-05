abstract class ILoginUsecaseExceptions implements Exception {
  ILoginUsecaseExceptions([String message = "Falha ao tentar fazer login"]);
}

class EmptyUsernameCaseException extends ILoginUsecaseExceptions {
  @override
  EmptyUsernameCaseException(
      [String message = "O campo nome não pode ser vazio"]);
}

class EmptyCaseException extends ILoginUsecaseExceptions {
  @override
  EmptyCaseException(
      [String message = "O campo nome e senha não podem ser vazios"]);
}

class UserEndsWithCaseException extends ILoginUsecaseExceptions {
  @override
  UserEndsWithCaseException(
      [String message = 'O nome de usuário não pode terminar com espaço']);
}

class PasswordEndsWithCaseException extends ILoginUsecaseExceptions {
  @override
  PasswordEndsWithCaseException(
      [String message = 'O campo de senha não pode terminar com espaço']);
}

class PasswordSizeCaseException extends ILoginUsecaseExceptions {
  @override
  PasswordSizeCaseException(
      [String message = 'O campo de senha não pode ter menos de 2 caracteres']);
}
