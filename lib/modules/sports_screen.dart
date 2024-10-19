import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/layout/cubit/cubit.dart';
import 'package:news/layout/cubit/states.dart';
import 'package:news/shared/components/components.dart';

class SportsScreen extends StatelessWidget {
  const SportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      builder: (BuildContext context, NewsStates state) {
        NewsCubit cubit = NewsCubit.get(context);
        return state is! NewsGetSportsDataLoadingState
            ? ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (BuildContext context, int index) =>
              buildArticleItem(cubit.sports[index]),
          separatorBuilder: (BuildContext context, int index) =>
              myDivider(),
          itemCount: cubit.sports.length,
        )
            : const Center(
          child: CircularProgressIndicator(
            color: Colors.deepOrange,
          ),
        );
      },
      listener: (BuildContext context, NewsStates state) {},
    );
  }
}
