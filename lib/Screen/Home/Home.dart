import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rentcar/Provider/provider.dart';
import 'package:rentcar/Screen/AddCar.dart';
import 'package:rentcar/Screen/DetailCar/DetailCars.dart';
import 'package:rentcar/Screen/Home/CarWidget.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(builder: (context, _) {
      return Consumer<AppProvider>(
        builder: (context, provider, _) {
          return Scaffold(
            backgroundColor: Color(0xff3F657B),
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(92.r),
              child: Stack(
                children: [
                  AppBar(
                    backgroundColor: Color(0xff3F657B),
                    elevation: 0,
                    // actions: [
                    //   PopupMenuButton(
                    //       padding: EdgeInsets.zero,
                    //       itemBuilder: (context) {
                    //         return [
                    //           PopupMenuItem<int>(
                    //             value: 0,
                    //             child: Row(
                    //               children: const [
                    //                 Text(
                    //                   "Theme",
                    //                 ),
                    //                 Spacer(),
                    //                 Icon(
                    //                   Icons.dark_mode,
                    //                   size: 30,
                    //                   color: Colors.black,
                    //                 ),
                    //               ],
                    //             ),
                    //           ),
                    //           // PopupMenuItem<int>(
                    //           //   value: 1,
                    //           //   child: Row(
                    //           //     children: const [
                    //           //       Text(
                    //           //         "Add User Doctor",
                    //           //       ),
                    //           //       Spacer(),
                    //           //       Icon(
                    //           //         Icons.add,
                    //           //         size: 30,
                    //           //         color: Colors.black,
                    //           //       ),
                    //           //     ],
                    //           //   ),
                    //           // ),
                    //         ];
                    //       },
                    //       onSelected: (value) {
                    //         if (value == 0) {
                    //           provider.theme();
                    //         }
                    //         // else if (value == 1) {
                    //         //   AppRouter.navigateToScreen(
                    //         //       DisplayAllUserDoctor());
                    //         // }
                    //       }),
                    // ],
                  ),
                  Center(
                    child: Container(
                      margin: EdgeInsetsDirectional.only(
                        top: 40.h,
                      ),
                      child: Image.asset(
                        height: 150.h,
                        width: 200.w,
                        'assets/images/logo.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            body: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.only(
                  topStart: Radius.circular(40.r),
                  topEnd: Radius.circular(40.r),
                ),
                color: Colors.white,
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: ListView.builder(
                itemCount: provider.allCar.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return DetailCars(index);
                        },
                      ));
                    },
                    child: CarWidget(
                      provider.allCar[index],
                    ),
                  );
                },
              ),
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: Color(0xff3F657B),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return AddCar();
                    },
                  ),
                );
              },
              child: Center(
                child: Icon(
                  Icons.add,
                  size: 30.r,
                ),
              ),
            ),
          );
        },
      );
    });
  }
}
