import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/layout/cubit/states.dart';
import 'package:news/modules/business_screen.dart';
import 'package:news/modules/science_screen.dart';
import 'package:news/modules/sports_screen.dart';
import 'package:news/shared/network/remote/Dio_Helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  List<String> appBarTexts = [
    "Business",
    "Science",
    "Sports",
  ];

  List<dynamic> business = [];
  List<dynamic> science = [];
  List<dynamic> sports = [];
  List<dynamic> search = [];

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

  void changeButtonState(int value) {
    currentIndex = value;
    emit(NewsChangeButtonNavState());
  }

  void getBusinessData() {
    emit(NewsGetBusinessDataLoadingState());
    DioHelper.getData(url: "v2/top-headlines",query: {
      "country": "us",
      "category": "business",
      "apiKey": "b22ad4fe40e442d3923a5e8c588914cf",
    }).then((onValue) {
      business = onValue.data['articles'];
      emit(NewsGetBusinessDataSuccessState());
    }).catchError((onError) {
      debugPrint(onError.toString());
      emit(NewsGetBusinessDataErrorState(onError));
    });
  }

  void getScienceData() {
    emit(NewsGetScienceDataLoadingState());
    DioHelper.getData(url: "v2/top-headlines",query: {
      "country": "us",
      "category": "science",
      "apiKey": "b22ad4fe40e442d3923a5e8c588914cf",
    }).then((onValue) {
      science = onValue.data['articles'];
      emit(NewsGetScienceDataSuccessState());
    }).catchError((onError) {
      debugPrint(onError.toString());
      emit(NewsGetScienceDataErrorState(onError));
    });
  }

  void getSportsData() {
    emit(NewsGetSportsDataLoadingState());
    DioHelper.getData(url: "v2/top-headlines",query: {
      "country": "us",
      "category": "sports",
      "apiKey": "b22ad4fe40e442d3923a5e8c588914cf",
    }).then((onValue) {
      sports = onValue.data['articles'];
      emit(NewsGetSportsDataSuccessState());
    }).catchError((onError) {
      debugPrint(onError.toString());
      emit(NewsGetSportsDataErrorState(onError));
    });
  }


  void getSearchData(String value) {
    emit(NewsGetSearchDataLoadingState());
    DioHelper.getData(url: "v2/everything",query: {
      "q": value,
      "apiKey": "b22ad4fe40e442d3923a5e8c588914cf",
    }).then((onValue) {
      search = onValue.data['articles'];
      emit(NewsGetSearchDataSuccessState());
    }).catchError((onError) {
      debugPrint(onError.toString());
      emit(NewsGetSearchDataErrorState(onError));
    });
  }
}