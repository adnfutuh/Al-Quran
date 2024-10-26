import 'package:alquran_app/features/quran/data/models/list_surah_model.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/core.dart';

import '../datasources/quran_remote_datasources.dart';
import '../models/surah_model.dart';

abstract class QuranRepository {
  Future<Either<AppException, SurahModel>> getQuran({required String id});
  Future<Either<AppException, ListSurahModel>> getListQuran(
      {required String id});
}

@LazySingleton(as: QuranRepository)
class QuranRepositoryImpl implements QuranRepository {
  final QuranRemoteDataSource quranRemoteDataSource;

  QuranRepositoryImpl({required this.quranRemoteDataSource});

  @override
  Future<Either<AppException, SurahModel>> getQuran(
      {required String id}) async {
    try {
      final result = await quranRemoteDataSource.getQuran(id: id);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerException(code: e.code, message: e.message));
    } on InternetConnectionException catch (e) {
      return Left(
          InternetConnectionException(code: e.code, message: e.message));
    } on DefaultAppException catch (e) {
      return Left(DefaultAppException(code: e.code, message: e.message));
    }
  }

  @override
  Future<Either<AppException, ListSurahModel>> getListQuran(
      {required String id}) async {
    try {
      final result = await quranRemoteDataSource.getQuran(id: id);
      return Right(result as ListSurahModel);
    } on ServerException catch (e) {
      return Left(ServerException(code: e.code, message: e.message));
    } on InternetConnectionException catch (e) {
      return Left(
          InternetConnectionException(code: e.code, message: e.message));
    } on DefaultAppException catch (e) {
      return Left(DefaultAppException(code: e.code, message: e.message));
    }
  }
}
