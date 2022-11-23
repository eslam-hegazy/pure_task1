import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pure_task1/screens/add_product.dart';
import 'package:pure_task1/screens/details_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:pure_task1/blocs/cubit/database_cubit.dart';
import 'package:pure_task1/data/carousel_data.dart';
import 'package:pure_task1/data/home_data.dart';
import 'package:pure_task1/widget/carsual_item.dart';
import 'package:pure_task1/widget/default_carsual_slider.dart';
import 'package:pure_task1/widget/item_grid.dart';

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DatabaseCubit, DatabaseState>(
        builder: ((context, state) {
          var cubit = DatabaseCubit.get(context);

          return OrientationBuilder(builder: ((context, orientation) {
            return Scaffold(
                floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    // cubit.insertToDatabase();
                    // cubit.getDataFromDatabase();
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return AddProduct();
                    }));
                  },
                  child: const Icon(Icons.add),
                ),
                appBar: AppBar(
                  title: const Text(
                    "الرئيسية",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  leading: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.language),
                  ),
                  centerTitle: true,
                  actions: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.ac_unit_outlined),
                    ),
                  ],
                ),
                body: ListView(
                  children: [
                    SizedBox(height: 3.h),
                    DefaultCursualSlider(orientation: orientation),
                    SizedBox(height: 3.h),
                    cubit.data.isNotEmpty
                        ? Expanded(
                            child: Wrap(
                              alignment: WrapAlignment.center,
                              direction: Axis.horizontal,
                              spacing: 5.h,
                              runSpacing: 20,
                              children:
                                  List.generate(cubit.data.length, (index) {
                                return InkWell(
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (_) {
                                      return DetailsScreen(
                                          id: cubit.data[index]['id'],
                                          image: cubit.data[index]['pic'],
                                          title: cubit.data[index]['title'],
                                          des: cubit.data[index]['des']);
                                    }));
                                  },
                                  child: ItemGrid(
                                    image: cubit.data[index]['pic'],
                                    title: cubit.data[index]['title'],
                                    orientation: orientation,
                                  ),
                                );
                              }),
                            ),
                          )
                        : const Expanded(
                            child: Center(
                              child: Text("Data Not Found Yet"),
                            ),
                          ),
                  ],
                ));
          }));
        }),
        listener: ((context, state) {}));
  }
}
