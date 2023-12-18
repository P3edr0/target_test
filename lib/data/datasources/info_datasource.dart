import 'package:dartz/dartz.dart';
import 'package:target_test/domain/usecases/info_usecases/info_usecase_exceptions.dart';

abstract class IFetchListDatasource {
  Future<Either<IInfoUsecaseExceptions, String>> call();
}

abstract class IInsertItemListDatasource {
  Future<Either<IInfoUsecaseExceptions, String>> call(
      String item, List<String> list, int index);
}

abstract class IDeleteItemListDatasource {
  Future<Either<IInfoUsecaseExceptions, String>> call(
      int index, List<String> list);
}

abstract class IUpdateItemListDatasource {
  Future<Either<IInfoUsecaseExceptions, String>> call(
      IUpdateItemListDatasource iUpdateItemListDatasource,
      int index,
      String updatedItem,
      List<String> list);
}
