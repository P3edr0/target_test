import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:target_test/data/datasources/info_datasource.dart';
import 'package:target_test/domain/usecases/info_usecases/info_usecase_exceptions.dart';

class FetchListLocalDatasourceImpl implements IFetchListDatasource {
  @override
  Future<Either<IInfoUsecaseExceptions, String>> call(
      String repositoryName) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      String? serializedList = prefs.getString(repositoryName);
      return Right(serializedList!);
    } catch (e) {
      return Left(NullListCaseException());
    }
  }
}
