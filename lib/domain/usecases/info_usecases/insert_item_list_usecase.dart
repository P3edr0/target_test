import 'package:dartz/dartz.dart';
import 'package:target_test/data/datasources/info_datasource.dart';
import 'package:target_test/data/repositories/insert_item_list_repository_implements.dart';
import 'package:target_test/domain/repositories/info_repository.dart';
import 'package:target_test/domain/usecases/info_usecases/info_usecase_exceptions.dart';

class InsertItemListUsecase implements IInsertItemListRepository {
  @override
  Future<Either<IInfoUsecaseExceptions, List<String>>> call(
      IInsertItemListDatasource iInsertItemListLocalDatasource,
      String item,
      List<String> list,
      int index) async {
    if (item == '') {
      return Left(
          EmptyFieldListCaseException('O nome do item não pode ser vazio'));
    }
    return InsertItemListRepositoryImpl()
        .call(iInsertItemListLocalDatasource, item, list, index);
  }
}
