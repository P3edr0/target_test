import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:target_test/data/datasources/info_datasource.dart';
import 'package:target_test/domain/usecases/info_usecases/info_usecase_exceptions.dart';

class UpdateItemListSharedDatasourceImpl implements IUpdateItemListDatasource {
  @override
  Future<Either<IInfoUsecaseExceptions, String>> call(
      IUpdateItemListDatasource iUpdateItemListDatasource,
      int index,
      String updatedItem,
      List<String> list) async {
    try {
      bool sucess = false;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      list[index] = updatedItem;
      String serializedList = json.encode(list);

      sucess = await prefs.setString('targetList', serializedList);
      if (sucess) {
        return Right(serializedList);
      } else {
        return Left(NotFoundListCaseException());
      }
    } catch (e) {
      return Left(NotFoundListCaseException(e.toString()));
    }
  }
}
