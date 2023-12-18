import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:target_test/data/datasources/info_datasource.dart';
import 'package:target_test/domain/usecases/info_usecases/delete_item_list_usecase.dart';
import 'package:target_test/domain/usecases/info_usecases/fetch_list_usecases.dart';
import 'package:target_test/domain/usecases/info_usecases/info_usecase_exceptions.dart';
import 'package:target_test/domain/usecases/info_usecases/insert_item_list_usecase.dart';
import 'package:target_test/domain/usecases/info_usecases/update_item_list_usecase.dart';
import 'package:test/test.dart';

import 'info_unit_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<IFetchListDatasource>(),
  MockSpec<IInsertItemListDatasource>(),
  MockSpec<IUpdateItemListDatasource>(),
  MockSpec<IDeleteItemListDatasource>()
])
void main() {
  group('Test Info Usecases', () {
    FetchListUsecases fetchListUsecases = FetchListUsecases();
    MockIFetchListDatasource mockIFetchListDatasource =
        MockIFetchListDatasource();
    MockIInsertItemListDatasource mockIInsertItemListDatasource =
        MockIInsertItemListDatasource();
    MockIUpdateItemListDatasource mockIUpdateItemListDatasource =
        MockIUpdateItemListDatasource();
    MockIDeleteItemListDatasource mockIDeleteItemListDatasource =
        MockIDeleteItemListDatasource();
    group('FetchList', () {
      test('aguardando uma lista de Strings', () async {
        when(mockIFetchListDatasource.call()).thenAnswer(
          (_) async => const Right('["item1", "item2"]'),
        );
        var result = await fetchListUsecases.call(mockIFetchListDatasource);

        log(result.toString());
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

      test('Aguardando uma EmptyFieldListException', () async {
        when(mockIInsertItemListDatasource.call('', [], 0))
            .thenAnswer((_) async => Left(EmptyFieldListCaseException()));
        var result = await insertItemListUsecase.call(
            mockIInsertItemListDatasource, '', [], 0);

        expect(result, isA<Left<IInfoUsecaseExceptions, List<String>>>());
        result.fold((exception) {
          expect(exception, isA<EmptyFieldListCaseException>());
        }, (value) {
          fail('Esperava exception, mas recebeu: $value');
        });
      });
      test('Aguardando uma Lista de Strings', () async {
        when(mockIInsertItemListDatasource.call('item certo', [], 0))
            .thenAnswer((_) async => const Right('["item1", "item2"]'));
        var result = await insertItemListUsecase.call(
            mockIInsertItemListDatasource, 'item certo', [], 0);
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

    group('Update Item', () {
      UpdateItemListUsecase updateItemListUsecase = UpdateItemListUsecase();

      test('Aguardando uma EmptyFieldListCaseException', () async {
        when(mockIUpdateItemListDatasource
                .call(mockIUpdateItemListDatasource, 2, '', []))
            .thenAnswer((_) async => Left(EmptyFieldListCaseException()));
        var result = await updateItemListUsecase
            .call(mockIUpdateItemListDatasource, 2, '', []);

        expect(result, isA<Left<IInfoUsecaseExceptions, List<String>>>());
        result.fold((exception) {
          expect(exception, isA<EmptyFieldListCaseException>());
        }, (value) {
          fail('Esperava exception, mas recebeu: $value');
        });
      });
      test('Aguardando uma IndexListCaseException', () async {
        when(mockIUpdateItemListDatasource
                .call(mockIUpdateItemListDatasource, -2, 'item 1', []))
            .thenAnswer((_) async => Left(IndexListCaseException()));
        var result = await updateItemListUsecase
            .call(mockIUpdateItemListDatasource, -2, 'item 1', []);

        expect(result, isA<Left<IInfoUsecaseExceptions, List<String>>>());
        result.fold((exception) {
          expect(exception, isA<IndexListCaseException>());
        }, (value) {
          fail('Esperava exception, mas recebeu: $value');
        });
      });
      test('Aguardando uma Lista de Strings', () async {
        when(mockIUpdateItemListDatasource.call(mockIUpdateItemListDatasource,
                0, 'item 3', ["item 1", "item 2"]))
            .thenAnswer((_) async => const Right('["item 1", "item 2"]'));
        var result = await updateItemListUsecase.call(
            mockIUpdateItemListDatasource, 0, 'item 3', ["item 1", "item 2"]);
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
    group('Delete Item', () {
      DeleteItemListUsecase deleteItemListUsecase = DeleteItemListUsecase();

      test('Aguardando uma IndexListCaseException', () async {
        when(mockIDeleteItemListDatasource.call(-2, []))
            .thenAnswer((_) async => Left(IndexListCaseException()));
        var result = await deleteItemListUsecase
            .call(mockIDeleteItemListDatasource, -2, []);

        expect(result, isA<Left<IInfoUsecaseExceptions, List<String>>>());
        result.fold((exception) {
          expect(exception, isA<IndexListCaseException>());
        }, (value) {
          fail('Esperava exception, mas recebeu: $value');
        });
      });

      test('Aguardando uma Lista de Strings', () async {
        when(mockIDeleteItemListDatasource.call(0, ["item 1", "item 2"]))
            .thenAnswer((_) async => const Right('["item 2"]'));
        var result = await deleteItemListUsecase
            .call(mockIDeleteItemListDatasource, 0, ["item 1", "item 2"]);
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
}
