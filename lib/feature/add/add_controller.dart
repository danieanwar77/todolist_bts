import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_getx_template/core/core/base/base_controller.dart';
import 'package:flutter_getx_template/feature/widgets/open_dialog.dart';
import 'package:get/get.dart';

class AddController extends BaseController{

  int id = 0;
  int todoCounter = 1;
  List<TextEditingController> todoControllerList = [TextEditingController()];

  @override
  void onInit()async{

    id = Get.arguments['id'];
    update();
    debugPrint('check argument : id $id');

    super.onInit();
  }

  void addTodo(){
    todoCounter++;
    todoControllerList.add(TextEditingController());
    update();
  }

  void removeTodo(){
    todoCounter--;
    todoControllerList.removeLast();
    update();
  }

  void removeTodoByIndex(int index){
    todoCounter--;
    todoControllerList.removeAt(index);
    update();
  }

  void sendTodoList()async{
    try{
      todoControllerList.forEach((item)async{
          var response = await repository.addTodoListItem(id, item.text);
          debugPrint('check add list item response: ${jsonEncode(response)}');
        }
      );
    } catch(e){
      openDialog('Failed', jsonEncode(e));
    } finally {
      openDialog('Success', 'Berhasil menambahkan item List!');
    }
  }
}