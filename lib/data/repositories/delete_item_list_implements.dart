import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:target_test/data/datasources/shared_preferences/delete_item_list_local_datasource.dart';
import 'package:target_test/domain/repositories/info_repository.dart';
import 'package:target_test/domain/usecases/info_usecases/info_usecase_exceptions.dart';

class DeleteItemListRepositoryImpl implements IDeleteItemListRepository {
  @override
  Future<Either<IInfoUsecaseExceptions, List<String>>> call(
      String repositoryName, int index, List<String> list) async {
    try {
      var result = await DeleteItemListLocalDatasource()
          .call(repositoryName, index, list);
      return result.fold((l) {
        return Left(l);
      }, (serializedList) {
        List<String> restoredList =
            List<String>.from(json.decode(serializedList));
        return Right(restoredList);
      });
    } catch (e) {
      return Left(NotFoundListCaseException(e.toString()));
    }
  }
}
