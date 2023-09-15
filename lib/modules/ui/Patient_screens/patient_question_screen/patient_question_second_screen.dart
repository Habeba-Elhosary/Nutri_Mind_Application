import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../shared/Constants/colors.dart';
import '../../../../shared/Constants/text_theme.dart';
import '../../../../shared/widgets/default_items.dart';
import '../../../../shared/widgets/patient_track_eating_widgets.dart';

class PatientQuestionSecondScreen extends StatefulWidget {
  const PatientQuestionSecondScreen({Key? key}) : super(key: key);

  @override
  State<PatientQuestionSecondScreen> createState() => PatientQuestionSecondScreenState();
}

class PatientQuestionSecondScreenState extends State<PatientQuestionSecondScreen> {
  String selectedContent = '';
  List<String> items = ['Yes', 'No'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        backPage: 'PatientQuestionFirstScreen',
        pageTitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(
              image: const AssetImage('assets/images/questionnaire.png'),
              width: 110.w,
            )
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.sp,vertical: 40.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Continue",
                style: AppTextStyle().textInAppBar.copyWith(fontSize: 17.sp)),
            SizedBox(height: 30.h),
            const MyProgressIndicator(
              input: 2,
              target: 4,
            ),
            SizedBox(height: 30.h),
            Text("Are you satisfied with your healing process today ?",
                style: AppTextStyle().textInAppBar.copyWith(fontSize: 17.sp,wordSpacing: 1.2.sp,height: 1.2.sp)),
            SizedBox(height: 35.h),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(20.sp),
                itemCount: items.length,
                itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.all(8.sp),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          selectedContent = items[index];
                          Navigator.pushNamed(
                              context, "PatientQuestionThirdScreen");
                        });
                      },
                      child: Container(
                        height: 55,
                        width: 170,
                        decoration: BoxDecoration(
                            border: Border.all(color: MyColors.darkBlue),
                            borderRadius: BorderRadius.circular(10.r)),
                        child: Center(
                          child: Text(
                            items[index],
                              style: AppTextStyle().textInAppBar.copyWith(color: MyColors.darkBlue,fontSize: 16.sp,)
                        ),
                        ),
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}