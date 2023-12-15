abstract class IInfoUsecaseExceptions implements Exception {
  final String message;
  IInfoUsecaseExceptions([this.message = "Falha ao tentar recuperar lista"]);
}

class NullListCaseException extends IInfoUsecaseExceptions {
  @override
  NullListCaseException([String message = "A lista não pode ser null"])
      : super(message);
}

class NotFoundListCaseException extends IInfoUsecaseExceptions {
  @override
  NotFoundListCaseException([String message = "A lista não foi encontrada"])
      : super(message);
}

class EmptyFieldListCaseException extends IInfoUsecaseExceptions {
  @override
  EmptyFieldListCaseException([String message = "O nome da lista está vazio"])
      : super(message);
}

class IndexListCaseException extends IInfoUsecaseExceptions {
  @override
  IndexListCaseException([String message = "O elemento não existe na lista"])
      : super(message);
}
