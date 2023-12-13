import 'package:dartz/dartz.dart';
import 'package:target_test/data/repositories/delete_item_list_implements.dart';
import 'package:target_test/domain/repositories/info_repository.dart';
import 'package:target_test/domain/usecases/info_usecases/info_usecase_exceptions.dart';

class DeleteItemListUsecase implements IDeleteItemListRepository {
  @override
  Future<Either<IInfoUsecaseExceptions, List<String>>> call(
      String repositoryName, int index, List<String> list) async {
    if (repositoryName == '') {
      return Left(EmptyFieldListCaseException());
    }

    if (index > list.length || index < 0) {
      return Left(
          EmptyFieldListCaseException('O elemento não existe na lista'));
    }
    return DeleteItemListRepositoryImpl().call(repositoryName, index, list);
  }
}
