import 'package:flutter/foundation.dart';
import 'package:flutter_getx_template/core/core/base/base_controller.dart';
import 'package:flutter_getx_template/data/model/user_model.dart';
import 'package:get/get.dart';

class SplashController extends BaseController {

  RxList<Data> userModel = RxList();

  @override
  void onInit() async {
    var response = await repository.getUser(1) ?? UserModel();
    userModel.value = response.data ?? [];
    debugPrint("UserModel: ${response.toJson().toString()}");
    update();
    super.onInit();
  }
}