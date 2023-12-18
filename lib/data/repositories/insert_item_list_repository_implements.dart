import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:target_test/data/datasources/info_datasource.dart';
import 'package:target_test/domain/repositories/info_repository.dart';
import 'package:target_test/domain/usecases/info_usecases/info_usecase_exceptions.dart';

class InsertItemListRepositoryImpl implements IInsertItemListRepository {
  @override
  Future<Either<IInfoUsecaseExceptions, List<String>>> call(
      IInsertItemListDatasource iInsertItemListLocalDatasource,
      String item,
      List<String> list,
      int index) async {
    try {
      var result = await iInsertItemListLocalDatasource.call(item, list, index);
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
