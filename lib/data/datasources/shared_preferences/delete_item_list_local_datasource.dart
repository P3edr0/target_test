import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:target_test/data/datasources/info_datasource.dart';
import 'package:target_test/domain/usecases/info_usecases/info_usecase_exceptions.dart';

class DeleteItemListLocalDatasource implements IDeleteItemListLocalDatasource {
  @override
  Future<Either<IInfoUsecaseExceptions, String>> call(
      String repositoryName, int index, List<String> list) async {
    try {
      bool sucess = false;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      list.removeAt(index);
      String serializedList = json.encode(list);

      sucess = await prefs.setString(repositoryName, serializedList);
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
