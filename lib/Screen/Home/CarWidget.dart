import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rentcar/Model/Car.dart';
import 'package:rentcar/Provider/provider.dart';

class CarWidget extends StatelessWidget {
  Car car;
  CarWidget(this.car);
  Image? images;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(builder: (context, _) {
      return Container(
        margin: EdgeInsetsDirectional.only(
          start: 14.w,
          end: 14.w,
          top: 10.h,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.only(
              topStart: Radius.circular(20.r),
              topEnd: Radius.circular(20.r),
              bottomEnd: Radius.circular(20.r),
              bottomStart: Radius.circular(20.r),
            ),
            border: const Border(
              top: BorderSide(
                width: 1,
                color: Colors.black12,
              ),
              bottom: BorderSide(
                width: 1,
                color: Colors.black12,
              ),
              left: BorderSide(
                width: 1,
                color: Colors.black12,
              ),
              right: BorderSide(
                width: 1,
                color: Colors.black12,
              ),
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              // alignment: AlignmentDirectional.topStart,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.only(
                      topStart: Radius.circular(20.r),
                      topEnd: Radius.circular(20.r),
                      bottomEnd: Radius.circular(10.r),
                      bottomStart: Radius.circular(10.r),
                    ),
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  width: double.infinity,
                  child: Image.memory(
                    base64Decode(car.image!),
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 143.h,
                  ),
                ),
                Container(
                  margin: EdgeInsetsDirectional.only(
                    top: 10.r,
                    start: 10.r,
                    end: 10.r,
                  ),
                  padding: EdgeInsetsDirectional.all(5.r),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(
                      20.r,
                    ),
                    color: Provider.of<AppProvider>(context, listen: false)
                                .selectedValue ==
                            car.selectCategory!
                        ? Colors.red
                        : Colors.green,
                  ),
                  child: Text(
                    car.selectCategory!,
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5.h,
            ),
            Container(
              margin: EdgeInsetsDirectional.only(
                top: 2.r,
                start: 5.r,
                end: 10.r,
                bottom: 5.r,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 10.w,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Text(
                      car.carName!,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff2E2F33),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsetsDirectional.only(
                start: 20.r,
                bottom: 10.r,
                end: 20.r,
              ),
              child: Row(
                children: [
                  Text(
                    car.manufactureCompany!,
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff2E2F33),
                    ),
                  ),
                  Spacer(),
                  Text(
                    '\$',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff121212),
                    ),
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  Text(
                    car.price!,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Color(0xff2E2F33),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
