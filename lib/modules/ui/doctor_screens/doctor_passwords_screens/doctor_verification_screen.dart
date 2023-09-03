import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import '../../../../shared/Constants/colors.dart';
import '../../../../shared/widgets/screens_widgets.dart';


class DoctorVerificationScreen extends StatefulWidget {
  const DoctorVerificationScreen({Key? key}) : super(key: key);

  @override
  State<DoctorVerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<DoctorVerificationScreen> {
  bool _onEditing = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(backPage: 'DoctorForgetPassword'),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              color: MyColors.white,
              padding: EdgeInsets.all(25.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 40.h,
                  ),
                  Text(
                    "Verification",
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        fontSize: 22.sp,
                        color: MyColors.black),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    "Please enter the code sent on your email address!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        fontSize: 13.sp,
                        color: MyColors.grey),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      VerificationCode(
                        itemSize: 60.sp,
                        fullBorder: true,
                        textStyle: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(color: MyColors.black),
                        keyboardType: TextInputType.number,
                        underlineColor: MyColors.darkBlue,
                        length: 4,
                        cursorColor: MyColors.darkBlue,
                        clearAll: Padding(
                          padding: EdgeInsets.all(3.sp),
                          child: Text(
                            'clear all',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              fontSize: 13.sp,
                              color: MyColors.darkBlue,
                            ),
                          ),
                        ),
                        onCompleted: (String value) {
                          setState(() {});
                        },
                        onEditing: (bool value) {
                          setState(() {
                            _onEditing = value;
                          });
                          if (!_onEditing) FocusScope.of(context).unfocus();
                        },
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(5.sp),
                    child: Center(
                      child: _onEditing
                          ? Text(
                        'Please enter full code',
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            fontSize: 13.sp,
                            color: MyColors.grey),
                      )
                          : const Text(''),
                    ),
                  ),
                  SizedBox(
                    height: 28.h,
                  ),
                  const MyBlueButton(text: 'Verify', page: 'DoctorCreatePasswordScreen'),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          height: 40.h,
          color: Colors.transparent,
          elevation: 0.sp,
          child: const MyTextGroup(
              staticText: "Didn’t received code?",
              dynamicText: "  Resend it",
              page: ''),
        )

    );
  }
}
