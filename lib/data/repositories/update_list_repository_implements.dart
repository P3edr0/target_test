import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:target_test/data/datasources/info_datasource.dart';
import 'package:target_test/domain/repositories/info_repository.dart';
import 'package:target_test/domain/usecases/info_usecases/info_usecase_exceptions.dart';

class UpdateItemListRepositoryImpl implements IUpdateItemListRepository {
  @override
  Future<Either<IInfoUsecaseExceptions, List<String>>> call(
      IUpdateItemListDatasource iUpdateItemListDatasource,
      int index,
      String updatedItem,
      List<String> list) async {
    try {
      var result = await iUpdateItemListDatasource.call(
          iUpdateItemListDatasource, index, updatedItem, list);
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
