import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pure_task1/screens/myhome.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:pure_task1/blocs/cubit/database_cubit.dart';

import '../widget/default_text_form_field.dart';

class UpdateProduct extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

  late TextEditingController titleController = TextEditingController();

  late TextEditingController desController = TextEditingController();
  UpdateProduct({
    Key? key,
    required this.id,
    required this.image,
    required this.title,
    required this.des,
  }) : super(key: key);
  final int id;
  final String image;
  final String title;
  final String des;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DatabaseCubit, DatabaseState>(
        builder: (context, state) {
          titleController.text = title;
          desController.text = des;
          var cubit = DatabaseCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text("Update Product"),
            ),
            body: Center(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(5.w),
                physics: const BouncingScrollPhysics(),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DefaultTextFormField(
                        controller: titleController,
                        hint: "Enter Title Product",
                        line: 1,
                        error: "Please Enter Title Product",
                      ),
                      DefaultTextFormField(
                        controller: desController,
                        hint: "Enter Title Product",
                        line: 4,
                        error: "Please Enter Description Product",
                      ),
                      CircleAvatar(
                        radius: 10.h,
                        backgroundImage: FileImage(File(image)),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            cubit.updateData(
                                id: id,
                                title: titleController.text,
                                des: desController.text,
                                image: image);
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (_) {
                              return MyHome();
                            }));
                          }
                        },
                        child: const Text("Update"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        listener: (context, state) {});
  }
}
