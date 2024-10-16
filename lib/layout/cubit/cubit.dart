import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/layout/cubit/states.dart';
import 'package:news/modules/business_screen.dart';
import 'package:news/modules/science_screen.dart';
import 'package:news/modules/sports_screen.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  List<String> appBarTexts = [
    "Business",
    "Science",
    "Sports",
  ];

  int currentIndex = 0;

  List<Widget> screens = [
    const BusinessScreen(),
    const ScienceScreen(),
    const SportsScreen(),
  ];

  List<BottomNavigationBarItem> items = [
    const BottomNavigationBarItem(
      label: "Business",
      icon: Icon(Icons.business),
    ),
    const BottomNavigationBarItem(
      label: "Science",
      icon: Icon(Icons.science),
    ),
    const BottomNavigationBarItem(
      label: "Sports",
      icon: Icon(Icons.sports),
    ),
  ];

  void changeButtonState(int value){
    currentIndex = value;
    emit(NewsChangeButtonNavState());
  }
}
