// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_page_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginPageController on LoginPageControllerBase, Store {
  late final _$loginKeyAtom =
      Atom(name: 'LoginPageControllerBase.loginKey', context: context);

  @override
  GlobalKey<FormState> get loginKey {
    _$loginKeyAtom.reportRead();
    return super.loginKey;
  }

  @override
  set loginKey(GlobalKey<FormState> value) {
    _$loginKeyAtom.reportWrite(value, super.loginKey, () {
      super.loginKey = value;
    });
  }

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

  late final _$doneAtom =
      Atom(name: 'LoginPageControllerBase.done', context: context);

  @override
  bool get done {
    _$doneAtom.reportRead();
    return super.done;
  }

  @override
  set done(bool value) {
    _$doneAtom.reportWrite(value, super.done, () {
      super.done = value;
    });
  }

  @override
  String toString() {
    return '''
loginKey: ${loginKey},
userController: ${userController},
done: ${done}
    ''';
  }
}
