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

  late final _$InfoPageControllerBaseActionController =
      ActionController(name: 'InfoPageControllerBase', context: context);

  @override
  dynamic removeItem(BuildContext context, int index) {
    final _$actionInfo = _$InfoPageControllerBaseActionController.startAction(
        name: 'InfoPageControllerBase.removeItem');
    try {
      return super.removeItem(context, index);
    } finally {
      _$InfoPageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
infoController: ${infoController},
infoList: ${infoList}
    ''';
  }
}
