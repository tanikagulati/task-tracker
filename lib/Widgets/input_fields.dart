import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InputFields extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController? controller;
  final Widget? widget;

  const InputFields(
      {Key? key,
      required this.title,
      required this.hint,
      this.controller,
      this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(height: 12.h),
      Text(
        title,
        style: TextStyle(fontSize: 18.sp,color: Colors.black),
      ),
      SizedBox(height: 5.h),
      Container(
          padding: EdgeInsets.only(left: 8, right: 8),
          //margin: EdgeInsets.only(top: 8.h),
          height: 42.h,
          width: double.maxFinite,
          child: TextFormField(
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hint,hintStyle: TextStyle(color: Colors.grey),
                suffixIcon: widget == null ? null : widget),
            controller: controller,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey),
          )),
    ]);
  }
}
