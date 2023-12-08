import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:target_test/presentation/ui/components/custom_alert_dialog.dart';
import 'package:url_launcher/url_launcher_string.dart';

part 'info_page_controller.g.dart';

class InfoPageController = InfoPageControllerBase with _$InfoPageController;

abstract class InfoPageControllerBase with Store {
  InfoPageControllerBase();

  @observable
  TextEditingController infoController = TextEditingController();

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
