import 'package:dartz/dartz.dart';
import 'package:target_test/domain/usecases/info_usecases/info_usecase_exceptions.dart';

abstract class IFetchListDatasource {
  Future<Either<IInfoUsecaseExceptions, String>> call(String listName);
}
