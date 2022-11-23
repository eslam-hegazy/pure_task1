import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DefaultTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final int line;
  final String error;
  const DefaultTextFormField({
    Key? key,
    required this.controller,
    required this.hint,
    required this.line,
    required this.error,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(3.h),
      child: TextFormField(
        controller: controller,
        maxLines: line,
        validator: (value) {
          if (value!.isEmpty) {
            return error;
          }
          return null;
        },
        decoration: InputDecoration(
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(2.h),
          ),
        ),
      ),
    );
  }
}
