import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pure_task1/blocs/cubit/database_cubit.dart';
import 'package:pure_task1/widget/default_text_form_field.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AddProduct extends StatefulWidget {
  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  late TextEditingController titleController = TextEditingController();

  late TextEditingController desController = TextEditingController();

  File? imageData;

  void getImage() async {
    final ImagePicker _picker = ImagePicker();
    var image = await _picker.pickImage(source: ImageSource.gallery);
    final imageTemporary = File(image!.path);
    setState(() {
      imageData = imageTemporary;
    });
  }

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DatabaseCubit, DatabaseState>(
        builder: (context, state) {
          var cubit = DatabaseCubit.get(context);
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                cubit.getDataFromDatabase();
              },
              child: const Icon(Icons.abc),
            ),
            appBar: AppBar(
              title: const Text("Add Product"),
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
                      MaterialButton(
                        padding: EdgeInsets.all(2.h),
                        shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.h),
                        ),
                        color: Colors.black,
                        onPressed: () {
                          getImage();
                        },
                        child: const Text(
                          "Get Image",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      imageData == null
                          ? Container(
                              height: 15,
                              margin: EdgeInsets.all(1.h),
                              child: Text("Please Upload Image"),
                            )
                          : CircleAvatar(
                              radius: 10.h,
                              backgroundImage: FileImage(imageData!),
                            ),
                      ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate() &&
                              imageData != null) {
                            cubit.insertToDatabase(
                              title: titleController.text,
                              des: desController.text,
                              image: imageData!.path,
                            );

                            Navigator.pop(context);
                          }
                        },
                        child: Text("Submit"),
                      )
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
