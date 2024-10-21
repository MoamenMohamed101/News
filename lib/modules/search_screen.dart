import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/layout/cubit/cubit.dart';
import 'package:news/layout/cubit/states.dart';
import 'package:news/shared/components/components.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit(),
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          NewsCubit cubit = NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: defaultTextFormField(
                    isObscure: false,
                    onChanged: (value) {
                      cubit.getSearchData(value);
                    },
                    validate: (value) {
                      if (value!.isEmpty) return "search is empty";
                      return null;
                    },
                    controller: searchController,
                    textInputType: TextInputType.text,
                    prefixIcon: Icons.search,
                    radius: 10,
                    hintText: 'write search title',
                  ),
                ),
                Expanded(
                  child: itemOfScreens(
                    context: context,
                    list: cubit.search,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}