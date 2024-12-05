import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_getx_template/core/core/base/base_controller.dart';
import 'package:flutter_getx_template/data/model/login_model.dart';
import 'package:flutter_getx_template/feature/home/home_screen.dart';
import 'package:flutter_getx_template/feature/widgets/error_snackbar.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends BaseController{
  final formKey = GlobalKey<FormState>();

  final loginStorage = GetStorage();

  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void onInit() async {
    debugPrint('check login : ${loginStorage.read('token') ?? '-'}');

    super.onInit();
  }

  void logIn()async{
    LoginModel? response = LoginModel();
    try{
      response = await repository.login(userName.text, password.text);
      update();
      debugPrint('response login: ${jsonEncode(response)}');
    } catch(e){
      ErrorSnackbar(Get.context, jsonEncode(e));
    } finally {
      loginStorage.write('token', response!.data!.token!);
      debugPrint('check token : ${loginStorage.read('token') ?? '-'}');
      Get.to<void>(HomeScreen());
    }

  }
}