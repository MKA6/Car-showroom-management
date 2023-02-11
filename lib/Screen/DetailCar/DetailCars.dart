import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rentcar/EditCar.dart';
import 'package:rentcar/Provider/provider.dart';
import 'package:rentcar/Screen/DetailCar/Splash/SplashCar.dart';

class DetailCars extends StatelessWidget {
  int index;
  DetailCars(this.index);

  // @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return Consumer<AppProvider>(
          builder: (context, provider, child) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                leading: InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(
                    Icons.arrow_back,
                    size: 30.r,
                    color: Colors.black,
                  ),
                ),
                actions: [
                  Container(
                    margin: EdgeInsetsDirectional.only(
                      end: 20.r,
                    ),
                    child: Row(
                      children: [
                        // InkWell(
                        //   onTap: () {
                        //     Navigator.of(context).push(
                        //       MaterialPageRoute(
                        //         builder: (context) {
                        //           return EditCar();
                        //         },
                        //       ),
                        //     );
                        //   },
                        //   child: Icon(
                        //     Icons.edit_note,
                        //     size: 35.r,
                        //     color: Color(0xff3F657B),
                        //   ),
                        // ),
                        SizedBox(
                          width: 10.w,
                        ),
                        InkWell(
                          onTap: () {
                            provider.Delete(index);
                            Navigator.of(context).pop();
                          },
                          child: Icon(
                            Icons.delete_sweep,
                            size: 30.r,
                            color: Color(0xff3F657B),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
                elevation: 0,
              ),
              body: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsetsDirectional.only(
                    start: 14.r,
                    end: 14.r,
                    top: 14.r,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Stack(
                      //   children: [
                      //     Container(
                      //       decoration: BoxDecoration(
                      //         borderRadius: BorderRadiusDirectional.all(
                      //           Radius.circular(10.r),
                      //         ),
                      //       ),
                      //       width: double.infinity,
                      //       clipBehavior: Clip.antiAliasWithSaveLayer,
                      //       child: Image.asset(
                      //         'assets/images/ss.jpg',
                      //         fit: BoxFit.cover,
                      //         width: double.infinity,
                      //         height: 193.h,
                      //       ),
                      //     ),
                      //     Container(
                      //       margin: EdgeInsetsDirectional.only(
                      //         top: 10.r,
                      //         start: 10.r,
                      //         end: 10.r,
                      //       ),
                      //       padding: EdgeInsetsDirectional.all(5.r),
                      //       decoration: BoxDecoration(
                      //         borderRadius: BorderRadiusDirectional.circular(
                      //           20.r,
                      //         ),
                      //         // ignore: unrelated_type_equality_checks
                      //         color: Color.fromARGB(255, 140, 202, 238),
                      //       ),
                      //       child: Text(
                      //         '${provider.allCar[index].selectCategory}',
                      //         style: TextStyle(
                      //           fontSize: 15.sp,
                      //           fontWeight: FontWeight.w600,
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      Stack(
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
                              color: Provider.of<AppProvider>(context,
                                              listen: false)
                                          .selectedValue ==
                                      '${provider.allCar[index].selectCategory}'
                                  ? Colors.red
                                  : Colors.green,
                            ),
                            child: Text(
                              '${provider.allCar[index].selectCategory}',
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
                        height: 14.h,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Text(
                              'Car Name : ',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff121212),
                              ),
                            ),
                            Text(
                              '${provider.allCar[index].carName}',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 122, 117, 117),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Table(
                        children: [
                          TableRow(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Maker : ',
                                    style: TextStyle(
                                      fontSize: 15.sp,
                                      color: Color(0xff121212),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  Text(
                                    '${provider.allCar[index].manufactureCompany}',
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromARGB(255, 122, 117, 117),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Power : ',
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      color: Color(0xff121212),
                                    ),
                                  ),
                                  Text(
                                    '${provider.allCar[index].power} Km/h',
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: Color.fromARGB(255, 122, 117, 117),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Table(
                        children: [
                          TableRow(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Range : ',
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      color: Color(0xff121212),
                                    ),
                                  ),
                                  Text(
                                    '${provider.allCar[index].range} Km',
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: Color.fromARGB(255, 105, 101, 101),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Seat : ',
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      color: Color(0xff121212),
                                    ),
                                  ),
                                  Text(
                                    '${provider.allCar[index].seat} person',
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: Color.fromARGB(255, 122, 117, 117),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Table(
                        children: [
                          TableRow(
                            children: [
                              Container(
                                width: 50.w,
                                child: Text(
                                  'Vestibulum feugiat, orci volutpat pharetra commodo scelerisque',
                                  maxLines: 2,
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: Color(0xff8C8581),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Table(
                        children: [
                          TableRow(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Color : ',
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      color: Color(0xff121212),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  Text(
                                    '${provider.allCar[index].Color}',
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromARGB(255, 122, 117, 117),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Price : ',
                                    style: TextStyle(
                                      fontSize: 17.sp,
                                      color: Color(0xff121212),
                                    ),
                                  ),
                                  Text(
                                    '\$ ${provider.allCar[index].price}',
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      color: Color(0xff3F657B),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Description :',
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: Color(0xff201E1D),
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            '${provider.allCar[index].details}',
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Color(0xff707070),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
