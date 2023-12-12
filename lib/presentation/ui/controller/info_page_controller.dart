import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:target_test/domain/usecases/info_usecases/fetch_list_usecases.dart';
import 'package:target_test/presentation/ui/components/custom_alert_dialog.dart';
import 'package:target_test/utils/constants.dart';
import 'package:url_launcher/url_launcher_string.dart';

part 'info_page_controller.g.dart';

class InfoPageController = InfoPageControllerBase with _$InfoPageController;

abstract class InfoPageControllerBase with Store {
  InfoPageControllerBase();

  @observable
  TextEditingController infoController = TextEditingController();
  @observable
  TextEditingController editInfoController = TextEditingController();

  @observable
  ObservableList<String> infoList = ObservableList.of(<String>[]);

  @action
  Future<void> abrirLink(String url, BuildContext context) async {
    if (Uri.parse(url).isAbsolute) {
      if (await canLaunchUrlString(url)) {
        await launchUrlString(url);
      } else {
        if (!context.mounted) return;
        await CustomAlertDialog().alertdialog(
          context,
          'Não foi possível abrir o link: $url',
          'Sair',
          () => Navigator.of(context).pop(),
        );
      }
    } else {
      if (!context.mounted) return;
      await CustomAlertDialog().alertdialog(
        context,
        'URL inválida: $url',
        'Sair',
        () => Navigator.of(context).pop(),
      );
    }
  }

  @action
  Future<void> fetchList() async {
    var result = await FetchListUsecases().call('targetList');
    result.fold((l) {
      log(l.message);
    }, (r) {
      infoList.clear();
      infoList.addAll(r);
    });
  }

  @action
  removeItem(BuildContext context, int index, SharedPreferences prefs) {
    String serializedList = "";

    String tempItem = infoList[index];
    infoList.removeAt(index);
    serializedList = json.encode(infoList);

    prefs
        .setString('targetList', serializedList)
        .whenComplete(() => Navigator.of(context).pop());

    final snackbar = SnackBar(
      backgroundColor: ProjectColors().darkGreen,
      content: const Text('Item deletado com sucesso.'),
      action: SnackBarAction(
        label: 'Desfazer',
        onPressed: () async {
          infoList.insert(index, tempItem);
          serializedList = json.encode(infoList);

          await prefs.setString('targetList', serializedList).whenComplete(() {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text('O Item foi restaurado'),
                backgroundColor: ProjectColors().darkBlue,
              ),
            );
          });
        },
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }
}
