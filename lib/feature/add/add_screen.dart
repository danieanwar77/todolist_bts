import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app.dart';
import 'package:flutter_getx_template/core/core/constant/constant.dart';
import 'package:flutter_getx_template/feature/add/add_controller.dart';
import 'package:get/get.dart';

class AddScreen extends StatelessWidget{
  const AddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: AddController(),
        builder: (controller) => Scaffold(
          appBar: AppBar(
            title: Text('Add To Do List'),
          ),
          body: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      for(var i = 0; i < controller.todoControllerList.length; i ++)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: Row(
                            children: [
                              Expanded(child: TextFormField(
                                controller: controller.todoControllerList[i],
                                  decoration: InputDecoration(
                                    label: Text('To do item ${i + 1}')
                                  ),
                                )
                              ),
                              IconButton(
                                  onPressed: (){
                                    controller.removeTodoByIndex(i);
                                  },
                                  icon: Icon(Icons.highlight_remove,
                                    color: Colors.red,
                                  )
                              )
                            ],
                          ),
                        ),
                      const SizedBox(height: 24,),
                      Row(
                        children: [
                          UnconstrainedBox(
                            child: GestureDetector(
                              onTap: (){
                                controller.addTodo();
                              },
                              child: Container(
                                margin: EdgeInsets.only(left: 16, bottom: 16),
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    color: primaryColor,
                                    borderRadius: BorderRadius.circular(8)
                                ),
                                child: Row(
                                  children: [
                                    Icon(Icons.add_rounded,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          UnconstrainedBox(
                            child: GestureDetector(
                              onTap: (){
                                controller.removeTodo();
                              },
                              child: Container(
                                margin: EdgeInsets.only(left: 16, bottom: 16),
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(8)
                                ),
                                child: Row(
                                  children: [
                                    Icon(Icons.remove,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 24,),
                      TextButton(
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 4),
                          width: double.infinity,
                          child: Center(
                            child: Text(
                              'Tambah',
                            ),
                          ),
                        ),
                        onPressed: () {
                          controller.sendTodoList();
                        },
                        style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                            elevation: 2,
                            backgroundColor: primaryColor),
                      ),
                    ],
                  ),
                ),
              )
          ),
        )
    );
  }

}