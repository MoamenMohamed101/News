import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/layout/cubit/cubit.dart';
import 'package:news/layout/cubit/states.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit(),
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          NewsCubit cubit = NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(cubit.appBarTexts[cubit.currentIndex]),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search),
                )
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: cubit.items,
              currentIndex: cubit.currentIndex,
              onTap: (value) => cubit.changeButtonState(value),
            ),
          );
        },
      ),
    );
  }
}
