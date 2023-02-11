import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rentcar/AppRouter/AppRouter.dart';
import 'package:rentcar/CoustomTextFormFiled.dart';
import 'package:rentcar/CoustomTextFormFiled2.dart';
import 'package:rentcar/Provider/provider.dart';

class EditCar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(builder: (context, _) {
      return Consumer<AppProvider>(
        builder: (context, provider, child) {
          return Scaffold(
            backgroundColor: Color(0xff3F657B),
            appBar: AppBar(
              leading: InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  margin: EdgeInsetsDirectional.only(
                    start: 30.r,
                  ),
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 30.r,
                  ),
                ),
              ),
              backgroundColor: Color(0xff3F657B),
              elevation: 0,
            ),
            body: Form(
              key: provider.formKey,
              child: SingleChildScrollView(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.only(
                      topStart: Radius.circular(40.r),
                      topEnd: Radius.circular(40.r),
                    ),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 10.h,
                        ),
                        CoustomTextFormFiled(
                          ' Car Name',
                          provider.textCarNameController,
                          TextInputType.text,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        CoustomTextFormFiled(
                          'Car Color',
                          provider.textCarColorController,
                          TextInputType.text,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        CoustomTextFormFiled(
                          'Car Manufacture Company',
                          provider.textCarManufactureCompanyController,
                          TextInputType.text,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        CoustomTextFormFiled(
                          'Car Power',
                          provider.textPowerController,
                          TextInputType.number,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        CoustomTextFormFiled(
                          'Car Price',
                          provider.textPriceController,
                          TextInputType.number,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        CoustomTextFormFiled(
                          'Car Range',
                          provider.textRangeController,
                          TextInputType.number,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        CoustomTextFormFiled(
                          'Car Seat',
                          provider.textSeatController,
                          TextInputType.number,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        CoustomTextFormFiled2(
                          'Car Details',
                          provider.textCarDetailsController,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Center(
                          child: Container(
                            width: double.infinity,
                            height: 50.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadiusDirectional.all(
                                Radius.circular(100.r),
                              ),
                            ),
                            margin: EdgeInsetsDirectional.only(
                              start: 5.w,
                              end: 5.w,
                            ),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Color(0xff3F657B),
                                ),
                                onPressed: () {
                                  // provider.updateProductInCart();
                                },
                                child: const Text('update Car')),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      );
    });
  }
}
