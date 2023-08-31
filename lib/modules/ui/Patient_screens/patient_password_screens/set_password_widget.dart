import 'dart:js';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../shared/Constants/colors.dart';

class SetPassword extends StatelessWidget {
  final yourText;
  final text;
  final backText;
  final nextScreen;
  final DONE;
  const SetPassword(
      {Key? key,
      required this.text,
      this.backText,
      required this.yourText,
      required this.nextScreen,
      this.DONE})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showGeneralDialog(
          context: context,
          pageBuilder: (BuildContext context, Animation<double> animation,
                  Animation<double> secondaryAnimation) =>
              AlertDialog(
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '${nextScreen}');
                },
                child: Center(
                  child: Column(
                    children: [
                      Container(
                        height: 40.h,
                        width: 140.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(color: MyColors.darkBlue),
                          boxShadow: const [
                            BoxShadow(
                              color: MyColors.darkBlue,
                              blurRadius: 10.0,
                              spreadRadius: 2.0,
                            ), //BoxShadow
                            BoxShadow(
                              color: Colors.white,
                              offset: Offset(0.0, 0.0),
                              blurRadius: 0.0,
                              spreadRadius: 0.0,
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            "Back to ${backText}",
                            style: const TextStyle(
                                color: MyColors.darkBlue,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Poppins'),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 14.h,
                      )
                    ],
                  ),
                ),
              )
            ],
            title: Padding(
              padding: EdgeInsets.all(15.sp),
              child: Column(
                children: [
                  Center(child: Image.asset("assets/images/true.png")),
                  SizedBox(height: 17.h),
                  Text(
                    "${yourText}",
                    style:
                        TextStyle(color: MyColors.grey, fontFamily: 'Poppins'),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    "$DONE",
                    style: TextStyle(
                        color: MyColors.darkBlue,
                        fontWeight: FontWeight.bold,
                        fontSize: 15.sp,
                        fontFamily: 'Poppins'),
                  ),
                ],
              ),
            ),
            contentPadding: EdgeInsets.all(20.sp),
          ),
          transitionBuilder: (ctx, anim1, anim2, child) => BackdropFilter(
            filter: ImageFilter.blur(
                sigmaX: 4 * anim1.value, sigmaY: 4 * anim1.value),
            child: FadeTransition(
              opacity: anim1,
              child: child,
            ),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        height: 60.h,
        decoration: BoxDecoration(
          color: MyColors.darkBlue,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Center(
          child: Text(
            "$text",
            style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                color: MyColors.white),
          ),
        ),
      ),
    );
  }
}
