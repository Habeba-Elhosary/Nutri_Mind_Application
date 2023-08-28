import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Constants/colors.dart';

class MyTextField extends StatelessWidget {
  final controller;
  final validator;
  final suffixIcon;
  final textType;
  final String hintText;
  final bool obscureText;

  const MyTextField({
    super.key,
    required this.hintText,
    required this.obscureText,
    this.controller,
    this.suffixIcon,
    required this.textType,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textType,
      controller: controller,
      obscureText: obscureText,
      validator: (input) {
        if (controller.text.isEmpty) {
          return '$hintText must not be empty';
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: MyColors.darkBlue),
            borderRadius: BorderRadius.circular(10.r)),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: MyColors.grey),
            borderRadius: BorderRadius.circular(10.r)),
        fillColor: MyColors.lightGrey,
        filled: true,
        hintText: hintText,
        hintStyle: const TextStyle(color: MyColors.grey),
        suffixIcon: suffixIcon,
      ),
    );
  }
}

class MyBlueButton extends StatelessWidget {
  final text;
  final page;
  const MyBlueButton({Key? key, required this.text, this.page}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '$page');
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

class MySmallButton extends StatelessWidget {
  final String imageAsset;
  const MySmallButton({Key? key, required this.imageAsset}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 40.h,
        decoration: BoxDecoration(
          color: MyColors.lightGrey,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(
              color: MyColors.grey, width: 0.5.w, style: BorderStyle.solid),
        ),
        child: Image(
          image: AssetImage(imageAsset),
        ),
      ),
    );
  }
}

class MyTextGroup extends StatelessWidget {
  final staticText;
  final dynamicText;
  final page;
  const MyTextGroup({
    Key? key,
    required this.staticText,
    required this.dynamicText,
    required this.page,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(
        '$staticText',
        style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            color: MyColors.black),
      ),
      InkWell(
        onTap: () {
          Navigator.pushNamed(context, '$page');
        },
        child: Text(
          '$dynamicText',
          style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: MyColors.darkBlue),
        ),
      ),
    ]);
  }
}
