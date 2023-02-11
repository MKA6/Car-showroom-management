import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CoustomTextFormFiled2 extends StatelessWidget {
  TextEditingController controller;
  String label;
  CoustomTextFormFiled2(this.label, this.controller);
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, _) {
        return Container(
          alignment: Alignment.bottomCenter,
          child: TextFormField(
            controller: controller,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Value must be entered';
              }
              return null;
            },
            decoration: InputDecoration(
              labelText: label,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: const BorderSide(
                  color: Colors.black,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0xff3F657B),
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.red,
                ),
              ),
              labelStyle: TextStyle(
                color: const Color(0xff3F657B),
                fontSize: 14.sp,
              ),
            ),
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            style: const TextStyle(
              color: Color(0xff3F657B),
            ),
          ),
        );
      },
    );
  }
}
