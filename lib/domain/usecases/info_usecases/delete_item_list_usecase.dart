import 'package:dartz/dartz.dart';
import 'package:target_test/data/datasources/info_datasource.dart';
import 'package:target_test/data/repositories/delete_item_list_implements.dart';
import 'package:target_test/domain/repositories/info_repository.dart';
import 'package:target_test/domain/usecases/info_usecases/info_usecase_exceptions.dart';

class DeleteItemListUsecase implements IDeleteItemListRepository {
  @override
  Future<Either<IInfoUsecaseExceptions, List<String>>> call(
      IDeleteItemListDatasource iDeleteItemListLocalDatasource,
      int index,
      List<String> list) async {
    if (index > list.length || index < 0) {
      return Left(IndexListCaseException('O elemento não existe na lista'));
    }
    return DeleteItemListRepositoryImpl()
        .call(iDeleteItemListLocalDatasource, index, list);
  }
}
