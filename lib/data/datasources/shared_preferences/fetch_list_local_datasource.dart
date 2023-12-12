import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:target_test/data/datasources/shared_preferences/info_datasource.dart';
import 'package:target_test/domain/usecases/info_usecases/info_usecase_exceptions.dart';

class FetchListLocalDatasourceImpl implements IFetchListDatasource {
  @override
  Future<Either<IInfoUsecaseExceptions, String>> call(String listName) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      String? serializedList = prefs.getString(listName);
      return Right(serializedList!);
    } catch (e) {
      return Left(NullListCaseException());
    }
  }
}
