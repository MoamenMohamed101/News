import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/layout/change_theme_state.dart';
import 'package:news/shared/network/local/cache_helper.dart';

class ChangeThemeCubit extends Cubit<ChangeThemeState> {
  ChangeThemeCubit() : super(ChangeThemeInitial());

  bool isDart = false;

  static ChangeThemeCubit get(context) => BlocProvider.of(context);

  void changeThemeColor({bool? fromShared}) {
    if (fromShared != null) {
      isDart = fromShared;
      debugPrint(isDart.toString());
      emit(NewsChangeColorThemeState());
    } else {
      isDart = !isDart;
      CacheHelper.setValue(value: isDart).then((onValue) {
        emit(NewsChangeColorThemeState());
      });
    }
  }
}
