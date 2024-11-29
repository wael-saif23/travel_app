part of 'lang_cubit.dart';

sealed class LangState {
  const LangState(this.locale);

  final Locale locale;
}

class SelectedLocale extends LangState {
  const SelectedLocale(super.locale);
}
