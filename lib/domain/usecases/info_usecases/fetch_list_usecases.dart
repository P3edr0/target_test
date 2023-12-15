import 'package:dartz/dartz.dart';
import 'package:target_test/data/repositories/fetch_list_repository_implements.dart';
import 'package:target_test/domain/repositories/info_repository.dart';
import 'package:target_test/domain/usecases/info_usecases/info_usecase_exceptions.dart';

class FetchListUsecases implements IFetchListRepository {
  @override
  Future<Either<IInfoUsecaseExceptions, List<String>>> call(
      String repositoryName) async {
    if (repositoryName == '') {
      return Left(
          EmptyFieldListCaseException('O nome do item não pode ser vazio'));
    }
    return FetchListRepositoryImpl().call(repositoryName);
  }
}
