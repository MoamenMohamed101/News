import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/layout/change_theme_state.dart';

class ChangeThemeCubit extends Cubit<ChangeThemeState> {
  ChangeThemeCubit() : super(ChangeThemeInitial());

  bool isDart = false;

  static ChangeThemeCubit get(context) => BlocProvider.of(context);

  void changeThemeColor(){
    isDart = !isDart;
    emit(NewsChangeColorThemeState());
  }
}
