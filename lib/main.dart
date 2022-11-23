import 'package:bloc/bloc.dart';
import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pure_task1/blocs/cubit/database_cubit.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'blocs/MyBlocObserver.dart';
import 'screens/myhome.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DatabaseCubit>(
      create: (context) => DatabaseCubit()..createDatabase(),
      child: ResponsiveSizer(
        builder: (context, orientation, screenType) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Directionality(
              textDirection: TextDirection.rtl,
              child: MyHome(),
            ),
          );
        },
      ),
    );
  }
}
