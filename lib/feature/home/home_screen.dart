import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_template/core/core/constant/colors.dart';
import 'package:flutter_getx_template/feature/add/add_screen.dart';
import 'package:flutter_getx_template/feature/home/home_controller.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: HomeController(),
        builder: (controller) => Scaffold(
          body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Spacer(),
                          GestureDetector(
                            onTap: (){
                              controller.addList();
                            },
                            child: CircleAvatar(
                              child: Icon(Icons.add_rounded),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 16,),
                      for(var i = 0; i < controller.listCount; i++)
                      Container(
                        margin: EdgeInsets.only(bottom: 16),
                        padding: EdgeInsets.all(16),
                        width: double.infinity,
                        color: Colors.orangeAccent,
                        child: Column(
                          children: [
                            Text('${controller.dataList[i].name}'),
                            const SizedBox(height: 16,),
                            controller.dataList[i].items != null ?
                                Column(
                                  children: [
                                    for(var n = 0; n < controller.dataList[i].items!.length; n++)
                                      Text(controller.dataList[i].items?[n].name ?? '-')
                                  ],
                                )
                                : UnconstrainedBox(
                              child: GestureDetector(
                                onTap: (){
                                  Get.to<void>(AddScreen(), arguments: {'id' : controller.dataList[i].id});
                                },
                                child: Container(
                                  margin: EdgeInsets.only(left: 16, bottom: 16),
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      color: graySoft,
                                      borderRadius: BorderRadius.circular(8)
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(Icons.add_rounded,
                                      ),
                                      Text('Tambah item')
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
          ),
        )
    );
  }
  
}