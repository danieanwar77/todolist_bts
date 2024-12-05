import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_getx_template/core/core/base/base_controller.dart';
import 'package:flutter_getx_template/data/model/get_list_model.dart';
import 'package:flutter_getx_template/feature/widgets/open_dialog.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends BaseController{

  final homeStorage = GetStorage();
  List<DataList> dataList = [];

  int listCount = 0;

  @override
  void onInit()async{
    debugPrint('check token : ${homeStorage.read('token') ?? '-'}');
    getList();

    super.onInit();
  }

  void getList()async{
    GetListModel? response = GetListModel();
    try{
      response = await repository.getList();
      debugPrint('check response add list: ${jsonEncode(response)}');
      update();
    } catch(e) {
      openDialog("Failed", jsonEncode(e));
    } finally {
      dataList = response!.data!;
      listCount = dataList.length;
      update();
      debugPrint('check list count: $listCount');
    }
  }

  void addList()async{
    try{
      var response = await repository.addTodoList('To do List ${listCount}');
      debugPrint('check response add list: ${jsonEncode(response)}');
    } catch(e) {
      openDialog("Failed", jsonEncode(e));
    } finally {
      openDialog("Success", "Berhasil menambahkan list!");
      getList();
    }

    update();
  }
}