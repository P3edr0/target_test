import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

// Include generated file
part 'login_page_controller.g.dart';

// This is the class used by rest of your codebase
class LoginPageController = LoginPageControllerBase with _$LoginPageController;

// The store-class
abstract class LoginPageControllerBase with Store {
  LoginPageControllerBase();
  @observable
  var loginKey = GlobalKey<FormState>();
  @observable
  TextEditingController userController = TextEditingController();
  @observable
  TextEditingController passwordController = TextEditingController();

  @observable
  bool done = false;
}
