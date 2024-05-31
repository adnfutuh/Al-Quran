import 'package:freezed_annotation/freezed_annotation.dart';

part 'list_surah_model.freezed.dart';
part 'list_surah_model.g.dart';

@freezed
class ListSurahModel with _$ListSurahModel {
  const factory ListSurahModel(
      {@JsonKey(name: 'nomor') required int number,
      @JsonKey(name: 'nama') required String name,
      @JsonKey(name: 'nama_latin') required String latinName,
      @JsonKey(name: 'jumlah_ayat') required int verseCount,
      @JsonKey(name: 'tempat_turun') required String placeOfDescent,
      @JsonKey(name: 'arti') required String meaning,
      @JsonKey(name: 'deskripsi') required String description,
      required String audio,
      required}) = _ListSurahModel;

  factory ListSurahModel.fromJson(Map<String, dynamic> json) =>
      _$ListSurahModelFromJson(json);
}
