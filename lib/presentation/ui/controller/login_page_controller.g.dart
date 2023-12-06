// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_page_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginPageController on LoginPageControllerBase, Store {
  late final _$userControllerAtom =
      Atom(name: 'LoginPageControllerBase.userController', context: context);

  @override
  TextEditingController get userController {
    _$userControllerAtom.reportRead();
    return super.userController;
  }

  @override
  set userController(TextEditingController value) {
    _$userControllerAtom.reportWrite(value, super.userController, () {
      super.userController = value;
    });
  }

  late final _$passwordControllerAtom = Atom(
      name: 'LoginPageControllerBase.passwordController', context: context);

  @override
  TextEditingController get passwordController {
    _$passwordControllerAtom.reportRead();
    return super.passwordController;
  }

  @override
  set passwordController(TextEditingController value) {
    _$passwordControllerAtom.reportWrite(value, super.passwordController, () {
      super.passwordController = value;
    });
  }

  late final _$abrirLinkAsyncAction =
      AsyncAction('LoginPageControllerBase.abrirLink', context: context);

  @override
  Future<void> abrirLink(String url, BuildContext context) {
    return _$abrirLinkAsyncAction.run(() => super.abrirLink(url, context));
  }

  late final _$LoginPageControllerBaseActionController =
      ActionController(name: 'LoginPageControllerBase', context: context);

  @override
  void login(BuildContext context) {
    final _$actionInfo = _$LoginPageControllerBaseActionController.startAction(
        name: 'LoginPageControllerBase.login');
    try {
      return super.login(context);
    } finally {
      _$LoginPageControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
userController: ${userController},
passwordController: ${passwordController}
    ''';
  }
}
