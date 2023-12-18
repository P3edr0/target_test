import 'package:dartz/dartz.dart';
import 'package:target_test/data/datasources/info_datasource.dart';
import 'package:target_test/domain/usecases/info_usecases/info_usecase_exceptions.dart';

abstract class IFetchListRepository {
  Future<Either<IInfoUsecaseExceptions, List<String>>> call(
      IFetchListDatasource iFetchListDatasource);
}

abstract class IUpdateItemListRepository {
  Future<Either<IInfoUsecaseExceptions, List<String>>> call(
      IUpdateItemListDatasource iUpdateItemListDatasource,
      int index,
      String updatedItem,
      List<String> list);
}

abstract class IDeleteItemListRepository {
  Future<Either<IInfoUsecaseExceptions, List<String>>> call(
      IDeleteItemListDatasource iDeleteItemListLocalDatasource,
      int index,
      List<String> list);
}

abstract class IInsertItemListRepository {
  Future<Either<IInfoUsecaseExceptions, List<String>>> call(
      IInsertItemListDatasource iInsertItemListLocalDatasource,
      String item,
      List<String> list,
      int index);
}
