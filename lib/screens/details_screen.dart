import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pure_task1/screens/update_product.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:pure_task1/blocs/cubit/database_cubit.dart';

class DetailsScreen extends StatelessWidget {
  final int id;
  final String image;
  final String title;
  final String des;
  const DetailsScreen({
    Key? key,
    required this.id,
    required this.image,
    required this.title,
    required this.des,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DatabaseCubit, DatabaseState>(
        builder: (context, state) {
          var cubit = DatabaseCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(title),
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return UpdateProduct(
                          id: id, image: image, title: title, des: des);
                    }));
                  },
                  icon: const Icon(
                    Icons.edit,
                    color: Colors.red,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    cubit.deleteData(id: id);
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30.h,
                    width: double.infinity,
                    child: Image.file(
                      File(image),
                      fit: BoxFit.fill,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(4.w),
                    child: Text(
                      title,
                      style: TextStyle(
                          fontSize: 22.sp, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(4.w),
                    child: Text(
                      des,
                      style: TextStyle(fontSize: 18.sp, color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        listener: (context, state) {});
  }
}
