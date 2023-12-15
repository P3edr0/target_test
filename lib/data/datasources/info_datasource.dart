import 'package:dartz/dartz.dart';
import 'package:target_test/domain/usecases/info_usecases/info_usecase_exceptions.dart';

abstract class IFetchListDatasource {
  Future<Either<IInfoUsecaseExceptions, String>> call(String repositoryName);
}

abstract class IInsertItemListLocalDatasource {
  Future<Either<IInfoUsecaseExceptions, String>> call(
      String repositoryName, String item, List<String> list, int index);
}

abstract class IDeleteItemListLocalDatasource {
  Future<Either<IInfoUsecaseExceptions, String>> call(
      String repositoryName, int index, List<String> list);
}

abstract class IUpdateItemListLocalDatasource {
  Future<Either<IInfoUsecaseExceptions, String>> call(
      String repositoryName, String newItem, int index, List<String> list);
}
