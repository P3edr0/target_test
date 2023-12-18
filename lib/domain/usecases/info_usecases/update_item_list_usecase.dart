import 'package:dartz/dartz.dart';
import 'package:target_test/data/datasources/info_datasource.dart';
import 'package:target_test/data/repositories/update_list_repository_implements.dart';
import 'package:target_test/domain/repositories/info_repository.dart';
import 'package:target_test/domain/usecases/info_usecases/info_usecase_exceptions.dart';

class UpdateItemListUsecase implements IUpdateItemListRepository {
  @override
  Future<Either<IInfoUsecaseExceptions, List<String>>> call(
      IUpdateItemListDatasource iUpdateItemListDatasource,
      int index,
      String updatedItem,
      List<String> list) async {
    if (updatedItem == '') {
      return Left(EmptyFieldListCaseException('O item não pode ser vazio'));
    }
    if (index > list.length || index < 0) {
      return Left(IndexListCaseException('O elemento não existe na lista'));
    }
    return UpdateItemListRepositoryImpl()
        .call(iUpdateItemListDatasource, index, updatedItem, list);
  }
}
