import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news/layout/change_theme_cubit.dart';
import 'package:news/layout/change_theme_state.dart';
import 'package:news/layout/news_layout.dart';
import 'package:news/shared/network/remote/Dio_Helper.dart';

import 'shared/bloc_observer.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChangeThemeCubit(),
      child: BlocConsumer<ChangeThemeCubit, ChangeThemeState>(
        listener: (context, state) {},
        builder: (context, state) {
          ChangeThemeCubit cubit = ChangeThemeCubit.get(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: const AppBarTheme(
                titleSpacing: 20,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.white,
                  statusBarIconBrightness: Brightness.dark,
                ),
                color: Colors.white,
                titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.deepOrange,
                elevation: 20,
              ),
              textTheme: const TextTheme(
                bodyMedium: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            darkTheme: ThemeData(
              textTheme: const TextTheme(
                bodyMedium: TextStyle(
                  color: Colors.white,
                ),
              ),
              scaffoldBackgroundColor: HexColor("333739"),
              appBarTheme: AppBarTheme(
                titleSpacing: 20,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: HexColor("333739"),
                  statusBarIconBrightness: Brightness.light,
                ),
                color: HexColor("333739"),
                titleTextStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
                iconTheme: const IconThemeData(
                  color: Colors.white,
                ),
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  backgroundColor: HexColor("333739"),
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.deepOrange,
                  elevation: 20,
                  unselectedItemColor: Colors.grey),
            ),
            themeMode: cubit.isDart ? ThemeMode.light : ThemeMode.dark,
            home: const NewsLayout(),
          );
        },
      ),
    );
  }
}