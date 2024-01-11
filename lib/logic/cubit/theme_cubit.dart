import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../themes/my_themes.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(MyThemes.getTheme("default"));

  void changeTheme(String genre) {
    emit(MyThemes.getTheme(genre));
  }
}