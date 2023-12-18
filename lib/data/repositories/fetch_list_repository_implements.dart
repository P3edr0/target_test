import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:target_test/data/datasources/info_datasource.dart';
import 'package:target_test/domain/repositories/info_repository.dart';
import 'package:target_test/domain/usecases/info_usecases/info_usecase_exceptions.dart';

class FetchListRepositoryImpl implements IFetchListRepository {
  @override
  Future<Either<IInfoUsecaseExceptions, List<String>>> call(
      IFetchListDatasource iFetchListDatasource) async {
    var result = await iFetchListDatasource.call();
    return result.fold((l) {
      return Left(l);
    }, (serializedList) {
      List<String> restoredList =
          List<String>.from(json.decode(serializedList));
      return Right(restoredList);
    });
  }
}
