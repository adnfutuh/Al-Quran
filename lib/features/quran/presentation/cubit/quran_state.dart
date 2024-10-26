part of 'quran_cubit.dart';

@freezed
class QuranState with _$QuranState {
  const factory QuranState.initial(
      {required SurahModel surahModel,
      ListSurahModel listSurahModel}) = _Initial;
  const factory QuranState.loading(
      {required SurahModel surahModel,
      ListSurahModel listSurahModel}) = _Loading;
  const factory QuranState.success(
      {required SurahModel surahModel,
      ListSurahModel listSurahModel}) = _Success;
  const factory QuranState.error({required AppException error}) = _Error;
}
