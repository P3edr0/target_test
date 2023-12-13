import 'package:dartz/dartz.dart';
import 'package:target_test/domain/usecases/info_usecases/info_usecase_exceptions.dart';

abstract class IFetchListDatasource {
  Future<Either<IInfoUsecaseExceptions, String>> call(String listName);
}

abstract class IInsertItemListDatasource {
  Future<Either<IInfoUsecaseExceptions, String>> call(
      String listName, String item, List<String> list);
}

abstract class IRemoveItemListDatasource {
  Future<Either<IInfoUsecaseExceptions, String>> call(
      String listName, int index, List<String> list);
}

abstract class IUpdateItemListDatasource {
  Future<Either<IInfoUsecaseExceptions, String>> call(
      String listName, String item, int index);
}
