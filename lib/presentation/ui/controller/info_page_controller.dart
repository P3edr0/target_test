import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:target_test/data/datasources/shared_preferences/delete_item_list_shared_datasource.dart';
import 'package:target_test/data/datasources/shared_preferences/fetch_list_shared_datasource.dart';
import 'package:target_test/data/datasources/shared_preferences/insert_item_list_shared_datasource.dart';
import 'package:target_test/data/datasources/shared_preferences/update_item_list_shared_datasource.dart';
import 'package:target_test/domain/usecases/info_usecases/delete_item_list_usecase.dart';
import 'package:target_test/domain/usecases/info_usecases/fetch_list_usecases.dart';
import 'package:target_test/domain/usecases/info_usecases/insert_item_list_usecase.dart';
import 'package:target_test/domain/usecases/info_usecases/update_item_list_usecase.dart';
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
    var result =
        await FetchListUsecases().call(FetchListSharedDatasourceImpl());
    result.fold((l) {
      log(l.message);

      throw (l);
    }, (r) {
      infoList.clear();
      infoList.addAll(r);
    });
  }

  @action
  Future<void> insertItem(String item, BuildContext context) async {
    var result = await InsertItemListUsecase()
        .call(InsertItemListSharedDatasourceImpl(), item, infoList, 0);
    result.fold((l) async {
      if (!context.mounted) return;
      await CustomAlertDialog().alertdialog(
        context,
        l.message,
        'Sair',
        () => Navigator.of(context).pop(),
      );
    }, (r) {
      infoList.clear();
      infoList.addAll(r);
      infoController.clear();

      final snackbar = SnackBar(
        backgroundColor: ProjectColors().darkGreen,
        content: const Text('Item inserido com sucesso.'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    });
  }

  @action
  Future<void> updateItem(
      String updatedItem, int index, BuildContext context) async {
    var result = await UpdateItemListUsecase().call(
        UpdateItemListSharedDatasourceImpl(), index, updatedItem, infoList);
    result.fold((l) async {
      if (!context.mounted) return;
      await CustomAlertDialog().alertdialog(
        context,
        l.message,
        'Sair',
        () => Navigator.of(context).pop(),
      );
    }, (r) {
      infoList.clear();
      infoList.addAll(r);

      final snackbar = SnackBar(
        backgroundColor: ProjectColors().darkGreen,
        content: const Text('Item editado com sucesso.'),
      );
      Navigator.of(context).pop();

      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    });
  }

  @action
  deleteItem(BuildContext context, int index) async {
    String tempItem = infoList[index];
    var result = await DeleteItemListUsecase()
        .call(DeleteItemListSharedDatasourceImpl(), index, infoList)
        .whenComplete(() => Navigator.of(context).pop());
    result.fold((l) async {
      if (!context.mounted) return;
      await CustomAlertDialog().alertdialog(
        context,
        l.message,
        'Sair',
        () => Navigator.of(context).pop(),
      );
    }, (r) {
      infoList.clear();
      infoList.addAll(r);
      final snackbar = SnackBar(
        backgroundColor: ProjectColors().darkGreen,
        content: const Text('Item deletado com sucesso.'),
        action: SnackBarAction(
          label: 'Desfazer',
          onPressed: () async {
            InsertItemListUsecase()
                .call(InsertItemListSharedDatasourceImpl(), tempItem, infoList,
                    index)
                .whenComplete(() {
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
    });
  }
}
