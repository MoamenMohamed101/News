import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/layout/cubit/cubit.dart';
import 'package:news/layout/cubit/states.dart';
import 'package:news/shared/components/components.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      builder: (BuildContext context, NewsStates state) {
        NewsCubit cubit = NewsCubit.get(context);
        return itemOfScreens(context: context, list: cubit.business);
      },
      listener: (BuildContext context, NewsStates state) {},
    );
  }
}

/*
ConditionalBuilder(
          condition: state is! NewsGetBusinessDataLoadingState,
          builder: (BuildContext context) => ListView.separated(
            itemBuilder: (BuildContext context, int index) => buildArticleItem(cubit.business[index]),
            separatorBuilder: (BuildContext context, int index) => myDivider(),
            itemCount: cubit.business.length,
          ),
          fallback: (BuildContext context) => const CircularProgressIndicator(
            color: Colors.deepOrange,
          ),
        );
*/