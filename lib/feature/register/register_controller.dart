import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_getx_template/core/core/base/base_controller.dart';
import 'package:flutter_getx_template/data/model/resgister_model.dart';
import 'package:flutter_getx_template/feature/widgets/error_snackbar.dart';
import 'package:flutter_getx_template/feature/widgets/open_dialog.dart';
import 'package:get/get.dart';

class RegisterController extends BaseController{

  final formKey = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void onInit()async{

    super.onInit();
  }

  void register()async{
    RegisterModel? response = RegisterModel();
    try{
      response = await repository.register(email.text, userName.text, password.text);
      update();
      debugPrint('response register: ${jsonEncode(response)}');
    } catch(e){
      ErrorSnackbar(Get.context, jsonEncode(e));
    } finally {
      openDialog("Success", "Berhasil register!");
    }
  }
}