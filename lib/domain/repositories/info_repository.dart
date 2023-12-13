import 'package:dartz/dartz.dart';
import 'package:target_test/domain/usecases/info_usecases/info_usecase_exceptions.dart';

abstract class IFetchListRepository {
  Future<Either<IInfoUsecaseExceptions, List<String>>> call(String list);
}

abstract class IUpdateItemListRepository {
  Future<Either<IInfoUsecaseExceptions, String>> call(String list);
}

abstract class IDeleteItemListRepository {
  Future<Either<IInfoUsecaseExceptions, String>> call(String list);
}

abstract class IInsertItemListRepository {
  Future<Either<IInfoUsecaseExceptions, List<String>>> call(
      String listName, String item, List<String> list);
}
