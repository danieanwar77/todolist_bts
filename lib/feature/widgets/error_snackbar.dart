import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_template/core/core/constant/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void ErrorSnackbar(context, String message){
  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).size.height - 120.h,
            right: 20,
            left: 20),
        content: Align(
          alignment: Alignment.topCenter,
          child: UnconstrainedBox(
            child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: snackbarErrorBackground,
                  border: Border.all(color: Color(0x1Fdc2626), width: 1),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        height: 18,
                        width: 18,
                        child: CircleAvatar(
                            backgroundColor: Color(0x8ab91c1c),
                            child: const Icon(
                              Icons.close_rounded, color: errorText, size: 12, )
                        )
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Text(message,
                          style: TextStyle(color: errorText)
                      ),
                    ),
                  ],
                )
            ),
          ),
        ),
      )
  );
}