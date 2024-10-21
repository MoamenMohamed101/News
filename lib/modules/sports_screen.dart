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
        return itemOfScreens(context:context, list: cubit.sports);
      },
      listener: (BuildContext context, NewsStates state) {},
    );
  }
}
