import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:target_test/domain/usecases/login_usecases.dart';
import 'package:target_test/presentation/ui/components/custom_alert_dialog.dart';
import 'package:target_test/presentation/ui/pages/info_page/info_page.dart';
import 'package:target_test/utils/constants.dart';
import 'package:url_launcher/url_launcher_string.dart';

part 'login_page_controller.g.dart';

class LoginPageController = LoginPageControllerBase with _$LoginPageController;

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
      (r) async {
        if (r == acessToken) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const InfoPage()),
          );
        } else {
          await CustomAlertDialog()
              .alertdialog(context, 'Credenciais Inválidas');
        }
      },
    );
  }

  @action
  Future<void> abrirLink(String url, BuildContext context) async {
    if (Uri.parse(url).isAbsolute) {
      if (await canLaunchUrlString(url)) {
        await launchUrlString(url);
      } else {
        if (!context.mounted) return;
        await CustomAlertDialog()
            .alertdialog(context, 'Não foi possível abrir o link: $url');
      }
    } else {
      if (!context.mounted) return;
      await CustomAlertDialog().alertdialog(context, 'URL inválida: $url');
    }
  }
}
