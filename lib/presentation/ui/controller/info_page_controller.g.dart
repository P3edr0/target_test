// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info_page_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$InfoPageController on InfoPageControllerBase, Store {
  late final _$infoControllerAtom =
      Atom(name: 'InfoPageControllerBase.infoController', context: context);

  @override
  TextEditingController get infoController {
    _$infoControllerAtom.reportRead();
    return super.infoController;
  }

  @override
  set infoController(TextEditingController value) {
    _$infoControllerAtom.reportWrite(value, super.infoController, () {
      super.infoController = value;
    });
  }

  late final _$editInfoControllerAtom =
      Atom(name: 'InfoPageControllerBase.editInfoController', context: context);

  @override
  TextEditingController get editInfoController {
    _$editInfoControllerAtom.reportRead();
    return super.editInfoController;
  }

  @override
  set editInfoController(TextEditingController value) {
    _$editInfoControllerAtom.reportWrite(value, super.editInfoController, () {
      super.editInfoController = value;
    });
  }

  late final _$infoListAtom =
      Atom(name: 'InfoPageControllerBase.infoList', context: context);

  @override
  ObservableList<String> get infoList {
    _$infoListAtom.reportRead();
    return super.infoList;
  }

  @override
  set infoList(ObservableList<String> value) {
    _$infoListAtom.reportWrite(value, super.infoList, () {
      super.infoList = value;
    });
  }

  late final _$abrirLinkAsyncAction =
      AsyncAction('InfoPageControllerBase.abrirLink', context: context);

  @override
  Future<void> abrirLink(String url, BuildContext context) {
    return _$abrirLinkAsyncAction.run(() => super.abrirLink(url, context));
  }

  late final _$fetchListAsyncAction =
      AsyncAction('InfoPageControllerBase.fetchList', context: context);

  @override
  Future<void> fetchList() {
    return _$fetchListAsyncAction.run(() => super.fetchList());
  }

  late final _$insertItemAsyncAction =
      AsyncAction('InfoPageControllerBase.insertItem', context: context);

  @override
  Future<void> insertItem(String item, BuildContext context) {
    return _$insertItemAsyncAction.run(() => super.insertItem(item, context));
  }

  late final _$updateItemAsyncAction =
      AsyncAction('InfoPageControllerBase.updateItem', context: context);

  @override
  Future<void> updateItem(String updatedItem, int index, BuildContext context) {
    return _$updateItemAsyncAction
        .run(() => super.updateItem(updatedItem, index, context));
  }

  late final _$removeItemAsyncAction =
      AsyncAction('InfoPageControllerBase.removeItem', context: context);

  @override
  Future removeItem(BuildContext context, int index) {
    return _$removeItemAsyncAction.run(() => super.removeItem(context, index));
  }

  @override
  String toString() {
    return '''
infoController: ${infoController},
editInfoController: ${editInfoController},
infoList: ${infoList}
    ''';
  }
}
