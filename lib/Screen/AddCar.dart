import 'dart:convert';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:rentcar/AppRouter/AppRouter.dart';
import 'package:rentcar/CoustomTextFormFiled.dart';
import 'package:rentcar/CoustomTextFormFiled2.dart';
import 'package:rentcar/Provider/provider.dart';

class AddCar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(builder: (context, _) {
      return Consumer<AppProvider>(
        builder: (context, provider, child) {
          //GestureDetector
          // onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          return Scaffold(
            resizeToAvoidBottomInset: false,
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
                // keyboardDismissBehavior:
                //     ScrollViewKeyboardDismissBehavior.onDrag,
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
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            provider.pickImages();
                          },
                          child: Container(
                            // margin: EdgeInsets.symmetric(vertical: 20.r),
                            width: double.infinity,
                            height: 200.r,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadiusDirectional.circular(40.r),
                            ),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: provider.pickedImage == null
                                ? Stack(
                                    children: [
                                      Image.asset(
                                        'assets/images/ss.jpg',
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                      ),
                                      Center(
                                        child: Icon(
                                          Icons.camera_alt,
                                          color: Colors.white,
                                          size: 70.r,
                                        ),
                                      ),
                                    ],
                                  )
                                : Image.file(
                                    provider.pickedImage!,
                                    fit: BoxFit.cover,
                                  ),
                          ),
                        ),

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

                        Container(
                          child: Row(
                            children: [
                              SizedBox(
                                width: 10.w,
                              ),
                              Text(
                                'Sold out or not',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: const Color(
                                    0xff3F657B,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20.w,
                              ),
                              DropdownButtonHideUnderline(
                                child: DropdownButton2(
                                  hint: Text(
                                    'Select Item',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Theme.of(context).hintColor,
                                    ),
                                  ),
                                  items: provider.item! //['Sold', 'UnSold']
                                      .map((item) => DropdownMenuItem<String>(
                                            value: item,
                                            child: Text(
                                              item,
                                              style: const TextStyle(
                                                fontSize: 14,
                                                color: const Color(
                                                  0xff3F657B,
                                                ),
                                              ),
                                            ),
                                          ))
                                      .toList(),
                                  value: provider.selectedValue,
                                  onChanged: (value) {
                                    provider.selectedValues(value!) as String;
                                  },
                                  buttonHeight: 40,
                                  buttonWidth: 140,
                                  itemHeight: 40,
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Row(
                        //   crossAxisAlignment: CrossAxisAlignment.center,
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     SizedBox(
                        //       width: 10.w,
                        //     ),
                        //     Text(
                        //       'Car Color',
                        //       style: TextStyle(
                        //         fontSize: 16.sp,
                        //         color: const Color(
                        //           0xff3F657B,
                        //         ),
                        //       ),
                        //     ),
                        //     const Spacer(),
                        //     InkWell(
                        //       onTap: () {
                        //         showDialog(
                        //           context: context,
                        //           builder: (context) {
                        //             return AlertDialog(
                        //               content: BlockPicker(
                        //                 pickerColor: provider.mycolor,
                        //                 onColorChanged: (Color color) {
                        //                   provider.myColors(color);
                        //                   // عرف اللون ك رق وبعديم خلي يتخ اللون ك رقم ويجيبة
                        //                 },
                        //               ),
                        //               actions: [
                        //                 ElevatedButton(
                        //                   style: ButtonStyle(
                        //                     backgroundColor:
                        //                         MaterialStateProperty.all(
                        //                       provider.mycolor,
                        //                     ),
                        //                     overlayColor:
                        //                         MaterialStateProperty.all(
                        //                       Colors.green,
                        //                     ),
                        //                   ),
                        //                   onPressed: () {
                        //                     Navigator.of(context).pop();
                        //                   },
                        //                   child: const Text(
                        //                     'Select',
                        //                     style: TextStyle(
                        //                       fontSize: 15,
                        //                     ),
                        //                   ),
                        //                 ),
                        //               ],
                        //             );
                        //           },
                        //         );
                        //       },
                        //       child: CircleAvatar(
                        //         backgroundColor: provider.mycolor,
                        //       ),
                        //     ),
                        //     SizedBox(
                        //       width: 30.w,
                        //     ),
                        //   ],
                        // ),

                        SizedBox(
                          height: 15.h,
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
                                  provider.addNewCar();
                                },
                                child: const Text('Add Car')),
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
