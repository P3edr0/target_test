import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:target_test/data/datasources/shared_preferences/fetch_list_local_datasource.dart';
import 'package:target_test/domain/repositories/info_repository.dart';
import 'package:target_test/domain/usecases/info_usecases/info_usecase_exceptions.dart';

class FetchListRepositoryImpl implements IFetchListRepository {
  @override
  Future<Either<IInfoUsecaseExceptions, List<String>>> call(
      String repositoryName) async {
    var result = await FetchListLocalDatasourceImpl().call(repositoryName);
    return result.fold((l) {
      return Left(l);
    }, (serializedList) {
      List<String> restoredList =
          List<String>.from(json.decode(serializedList));
      return Right(restoredList);
    });
  }
}
