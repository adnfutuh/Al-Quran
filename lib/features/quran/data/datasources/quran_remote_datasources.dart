import 'package:alquran_app/features/quran/data/models/list_surah_model.dart';
import 'package:alquran_app/features/quran/data/models/surah_model.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/core.dart';

abstract class QuranRemoteDataSource {
  Future<SurahModel> getQuran({required String id});
  Future<ListSurahModel> getListQuran({required String id});
}

@LazySingleton(as: QuranRemoteDataSource)
class QuranRemoteDataSourceImpl implements QuranRemoteDataSource {
  final HttpClientService httpClientService;
  QuranRemoteDataSourceImpl({@Named("base") required this.httpClientService});

  @override
  Future<SurahModel> getQuran({required String id}) async {
    try {
      final response = await httpClientService.get(
        path: 'https://quran-api.santrikoding.com/api/surah/$id',
      );
      return SurahModel.fromJson(response.data);
    } catch (e) {
      throw ServerException(error: e, message: e.toString());
    }
  }

  @override
  Future<ListSurahModel> getListQuran({required String id}) async {
    try {
      final response = await httpClientService.get(
        path: 'https://quran-api.santrikoding.com/api/surah',
      );
      return ListSurahModel.fromJson(response.data);
    } catch (e) {
      throw ServerException(error: e, message: e.toString());
    }
  }
}
