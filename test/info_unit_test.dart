import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:target_test/domain/usecases/info_usecases/fetch_list_usecases.dart';
import 'package:target_test/domain/usecases/info_usecases/info_usecase_exceptions.dart';
import 'package:target_test/domain/usecases/info_usecases/insert_item_list_usecase.dart';

void main() {
  group('Test Info Usecases', () {
    group('FetchList', () {
      FetchListUsecases fetchListUsecases = FetchListUsecases();

      test('EmptyFieldListCase', () async {
        var result = await fetchListUsecases.call('');

        expect(result, isA<Left<IInfoUsecaseExceptions, List<String>>>());
        result.fold(
          (exception) {
            expect(exception, isA<EmptyFieldListCaseException>());
          },
          (value) {
            fail('Esperava uma exceção, mas recebeu: $value');
          },
        );
      });
      test('NullListCase', () async {
        var result = await fetchListUsecases.call('fkfl');

        expect(result, isA<Left<IInfoUsecaseExceptions, List<String>>>());
        result.fold(
          (exception) {
            expect(exception, isA<NullListCaseException>());
          },
          (value) {
            fail('Esperava uma exceção, mas recebeu: $value');
          },
        );
      });
      test('Fetch Sucess', () async {
        var result = await fetchListUsecases.call('targetlist');

        expect(result, isA<Right<IInfoUsecaseExceptions, List<String>>>());
        result.fold(
          (exception) {
            fail('Esperava uma lista, mas recebeu: $exception');
          },
          (value) {
            expect(value, isA<List<String>>());
          },
        );
      });
    });

    group('Insert Item', () {
      InsertItemListUsecase insertItemListUsecase = InsertItemListUsecase();

      test('EmptyFieldListCase', () async {
        var result =
            await insertItemListUsecase.call('targetlist', 'item test', [], 0);

        expect(result, isA<Left<IInfoUsecaseExceptions, List<String>>>());
        result.fold((exception) {
          fail('Esperava uma lista, mas recebeu: $exception');
        }, (value) {
          expect(value, isA<List<String>>());
        });
        test('NullListCase', () async {
          var result = await insertItemListUsecase.call(
              'targetlist', 'item test', [], 0);
          expect(result, isA<Left<IInfoUsecaseExceptions, List<String>>>());
          result.fold(
            (exception) {
              expect(exception, isA<NullListCaseException>());
            },
            (value) {
              fail('Esperava uma exceção, mas recebeu: $value');
            },
          );
        });
        test('Fetch Sucess', () async {
          var result = await insertItemListUsecase.call(
              'targetlist', 'item test', [], 0);
          expect(result, isA<Right<IInfoUsecaseExceptions, List<String>>>());
          result.fold(
            (exception) {
              fail('Esperava uma lista, mas recebeu: $exception');
            },
            (value) {
              expect(value, isA<List<String>>());
            },
          );
        });
      });
    });
  });
}
