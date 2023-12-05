import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:target_test/domain/usecases/login_usecases.dart';
import 'package:target_test/presentation/ui/pages/home_page/components/custom_alert_dialog.dart';
import 'package:target_test/presentation/ui/pages/info_page/info_page.dart';

// Include generated file
part 'login_page_controller.g.dart';

// This is the class used by rest of your codebase
class LoginPageController = LoginPageControllerBase with _$LoginPageController;

// The store-class
abstract class LoginPageControllerBase with Store {
  LoginPageControllerBase();

  @observable
  TextEditingController userController = TextEditingController();

  @observable
  TextEditingController passwordController = TextEditingController();

  @action
  void login(BuildContext context) {
    var response =
        LoginUseCase().call(userController.text, passwordController.text);
    response.fold(
      (l) async {
        await CustomAlertDialog().alertdialog(context, l.message);
      },
      (r) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const InfoPage()),
        );
      },
    );
  }
}
