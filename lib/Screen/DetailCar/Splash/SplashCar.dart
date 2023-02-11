import 'dart:convert';

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rentcar/AppRouter/AppRouter.dart';
import 'package:rentcar/Model/Slider.dart';
import 'package:rentcar/Provider/provider.dart';
import 'package:rentcar/Screen/Home/Home.dart';

class SplashTow extends StatelessWidget {
  List<Sliders> sliders = [
    Sliders(
      image1: 'assets/images/ss.jpg',
    ),
    Sliders(
      image1: 'assets/images/ss.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (BuildContext context, Widget? child) {
        return Consumer<AppProvider>(builder: (context, provider, _) {
          return Container(
            width: double.infinity,
            height: 193.h,
            child: Stack(
              children: [
                Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    return Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadiusDirectional.all(
                              Radius.circular(10.r),
                            ),
                          ),
                          width: double.infinity,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Image.memory(
                            base64Decode('${provider.allCar[index].image}'),
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: 193.h,
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
                            // ignore: unrelated_type_equality_checks
                            color: Color.fromARGB(255, 140, 202, 238),
                          ),
                          child: Text(
                            '${provider.allCar[index].selectCategory}',
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                  itemCount: sliders.length,
                  // pagination: SwiperPagination(),
                ),
              ],
            ),
          );
        });
      },
    );
  }
}
