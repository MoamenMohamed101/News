import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/layout/change_theme_cubit.dart';
import 'package:news/layout/cubit/cubit.dart';
import 'package:news/layout/cubit/states.dart';
import 'package:news/modules/search_screen.dart';
import 'package:news/shared/components/components.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()
        ..getBusinessData()
        ..getScienceData()
        ..getSportsData(),
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          NewsCubit cubit = NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(cubit.appBarTexts[cubit.currentIndex]),
              actions: [
                IconButton(
                  onPressed: () {
                    ChangeThemeCubit.get(context).changeThemeColor();
                  },
                  icon: const Icon(Icons.brightness_4_outlined),
                ),
                IconButton(
                  onPressed: () => navigateTo(context, SearchScreen()),
                  icon: const Icon(Icons.search),
                ),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: cubit.items,
              currentIndex: cubit.currentIndex,
              onTap: (value) => cubit.changeButtonState(value),
            ),
            body: cubit.screens[cubit.currentIndex],
          );
        },
      ),
    );
  }
}
