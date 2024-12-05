import 'dart:async';

import 'package:flutter_getx_template/data/model/add_list_item_model.dart';
import 'package:flutter_getx_template/data/model/add_list_model.dart';
import 'package:flutter_getx_template/data/model/get_list_model.dart';
import 'package:flutter_getx_template/data/model/login_model.dart';
import 'package:flutter_getx_template/data/model/resgister_model.dart';
import 'package:flutter_getx_template/data/model/user_model.dart';

abstract interface class Repository {
  FutureOr<UserModel?> getUser(int page);
  FutureOr<LoginModel?> login(String username, String password);
  FutureOr<RegisterModel?> register(String email, String username, String password);
  FutureOr<GetListModel?> getList();
  FutureOr<AddListModel?> addTodoList(String name);
  FutureOr<AddListItemModel?> addTodoListItem(int id, String name);
}
