class NewsStates {}

class NewsInitialState extends NewsStates {}

class NewsChangeButtonNavState extends NewsStates {}

class NewsGetBusinessDataLoadingState extends NewsStates {}

class NewsGetBusinessDataSuccessState extends NewsStates {}

class NewsGetBusinessDataErrorState extends NewsStates {
  final String error;

  NewsGetBusinessDataErrorState(this.error);
}

class NewsGetScienceDataLoadingState extends NewsStates {}

class NewsGetScienceDataSuccessState extends NewsStates {}

class NewsGetScienceDataErrorState extends NewsStates {
  final String error;

  NewsGetScienceDataErrorState(this.error);
}

class NewsGetSportsDataLoadingState extends NewsStates {}

class NewsGetSportsDataSuccessState extends NewsStates {}

class NewsGetSportsDataErrorState extends NewsStates {
  final String error;

  NewsGetSportsDataErrorState(this.error);
}
