import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app.dart';
import 'package:flutter_getx_template/core/core/constant/colors.dart';
import 'package:flutter_getx_template/feature/register/register_controller.dart';
import 'package:flutter_getx_template/feature/widgets/error_snackbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatelessWidget{
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: RegisterController(),
        builder: (controller) => Scaffold(
          appBar: AppBar(
            title: Text('Register'),
          ),
          body: SafeArea(child: Column(
            children: [
              Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: Form(
                      key: controller.formKey,
                      child: Column(
                        children: [
                          Spacer(),
                          TextFormField(
                            controller: controller.email,
                            cursorColor: Colors.black,
                            onTapOutside: (event){
                              FocusScope.of(context).unfocus();
                            },
                            style: TextStyle(
                                fontSize: 14
                            ),
                            decoration: InputDecoration(
                                labelText: 'Alamat Email',
                                labelStyle: TextStyle(
                                    fontSize: 12.sp,
                                    color: controller.formKey.currentState?.validate() == false && controller.userName.text == '' ? Colors.red : grayTua
                                ),
                                hintStyle: TextStyle(
                                    fontSize:10
                                ),
                                contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                                errorStyle: const TextStyle(height: 0.01),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: graySoft),
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red),
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red),
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: primaryColor),
                                  borderRadius: BorderRadius.circular(50.0),
                                )
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return '';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 10,),
                          TextFormField(
                            controller: controller.userName,
                            cursorColor: Colors.black,
                            onTapOutside: (event){
                              FocusScope.of(context).unfocus();
                            },
                            style: TextStyle(
                                fontSize: 14
                            ),
                            decoration: InputDecoration(
                                labelText: 'User Name',
                                labelStyle: TextStyle(
                                    fontSize: 12.sp,
                                    color: controller.formKey.currentState?.validate() == false && controller.userName.text == '' ? Colors.red : grayTua
                                ),
                                hintStyle: TextStyle(
                                    fontSize:10
                                ),
                                contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                                errorStyle: const TextStyle(height: 0.01),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: graySoft),
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red),
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red),
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: primaryColor),
                                  borderRadius: BorderRadius.circular(50.0),
                                )
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return '';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 10,),
                          TextFormField(
                            controller: controller.password,
                            obscureText: true,
                            cursorColor: Colors.black,
                            onTapOutside: (event){
                              FocusScope.of(context).unfocus();
                            },
                            decoration: InputDecoration(
                                labelText: 'Password',
                                labelStyle: TextStyle(
                                    fontSize: 12.sp,
                                    color: controller.formKey.currentState?.validate() == false && controller.password.text == '' ? Colors.red : grayTua
                                ),
                                fillColor: surface,
                                hintStyle: TextStyle(fontSize:10),
                                contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                                errorStyle: const TextStyle(height: 0.01),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: graySoft),
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red),
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red),
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: primaryColor),
                                  borderRadius: BorderRadius.circular(50.0),
                                )
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return '';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 24.h,),
                          TextButton(
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 4),
                              width: double.infinity,
                              child: Center(
                                child: Text(
                                  'Register',
                                  style: TextStyle(
                                      color: primaryColor,
                                      fontSize: 12.sp
                                  ),
                                ),
                              ),
                            ),
                            onPressed: () {
                              if (controller.formKey.currentState!.validate()) {
                                controller.register();
                              } else {
                                ErrorSnackbar(Get.context, 'Isi form yang dibutuhkan');
                              }
                            },
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.white,
                              elevation: 2,
                              backgroundColor: Colors.white,
                              side: BorderSide(
                                color: gray,
                              ),
                            ),
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                  )
              )
            ],
          )
          ),
        )
    );
  }

}