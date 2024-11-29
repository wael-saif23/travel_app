import 'dart:ui';
import 'package:bloc/bloc.dart';

import '../../res/keys.dart';
part 'lang_state.dart';

class LangCubit extends Cubit<LangState> {
  LangCubit() : super(const SelectedLocale(Locale(KAppKeys.langKey)));

  void toArabic() {
    emit(const SelectedLocale(Locale('ar')));
  }

  void toEnglish() {
    emit(const SelectedLocale(Locale('en')));
  }
}
