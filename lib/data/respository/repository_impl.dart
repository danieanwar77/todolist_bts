import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_getx_template/data/model/add_list_item_model.dart';
import 'package:flutter_getx_template/data/model/add_list_model.dart';
import 'package:flutter_getx_template/data/model/get_list_model.dart';
import 'package:flutter_getx_template/data/model/login_model.dart';
import 'package:flutter_getx_template/data/model/resgister_model.dart';
import 'package:flutter_getx_template/data/model/user_model.dart';
import 'package:flutter_getx_template/data/network.dart';
import 'package:flutter_getx_template/data/respository/repository.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class RepositoryImpl implements Repository {
  RepositoryImpl({required this.networkCore});

  NetworkCore networkCore;
  final repositoryStorage = GetStorage();

  @override
  FutureOr<UserModel?> getUser(int page) async {
    late Response? response;
    try {
      response = await networkCore.getRequest<UserModel>("/users",
          queryParameters: {
            "page": page.toString()
          },
          decoder: (val) => UserModel.fromJson(val),
          headers: {
            'Accept': 'application/json',
            'Content-Type': "application/json"
          });
    } on Exception catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
    return response?.body;
  }

  FutureOr<LoginModel?> login(String username, String password) async {
    late Response? response;
    try {
      response = await networkCore.postRequst<LoginModel>("/login",
          body: {
            "username": username,
            "password": password
          },
          decoder: (val) => LoginModel.fromJson(val),
          headers: {
            'Accept': 'application/json',
            'Content-Type': "application/json"
          });
    } on Exception catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
    return response?.body;
  }

  FutureOr<RegisterModel?> register(String email, String username, String password) async {
    late Response? response;
    try {
      response = await networkCore.postRequst<RegisterModel>("/register",
          body: {
            "email": email,
            "username": username,
            "password": password
          },
          decoder: (val) => RegisterModel.fromJson(val),
          headers: {
            'Accept': 'application/json',
            'Content-Type': "application/json"
          });
    } on Exception catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
    return response?.body;
  }

  FutureOr<AddListModel?> addTodoList(String name) async {
    late Response? response;
    try {
      response = await networkCore.postRequst<AddListModel>("/checklist",
          body: {
            "name": name,
          },
          decoder: (val) => AddListModel.fromJson(val),
          headers: {
            'Accept': 'application/json',
            'Content-Type': "application/json",
            'Authorization': "Bearer ${repositoryStorage.read('token')}",
          });
    } on Exception catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
    return response?.body;
  }

  FutureOr<AddListItemModel?> addTodoListItem(int id, String name) async {
    late Response? response;
    try {
      response = await networkCore.postRequst<AddListItemModel>("/checklist/$id/item",
          body: {
            "itemName": name,
          },
          decoder: (val) => AddListItemModel.fromJson(val),
          headers: {
            'Accept': 'application/json',
            'Content-Type': "application/json",
            'Authorization': "Bearer ${repositoryStorage.read('token')}",
          });
    } on Exception catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
    return response?.body;
  }

  FutureOr<GetListModel?> getList() async {
    late Response? response;
    try {
      response = await networkCore.getRequest<GetListModel>("/checklist",
          decoder: (val) => GetListModel.fromJson(val),
          headers: {
            'Accept': 'application/json',
            'Content-Type': "application/json",
            'Authorization': "Bearer ${repositoryStorage.read('token')}",
          });
    } on Exception catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
    return response?.body;
  }
}
