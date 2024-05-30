import 'package:alquran_app/core/core.dart';
import 'package:alquran_app/features/quran/data/models/surah_model.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../data/repositories/quran_repositories.dart';

@lazySingleton
class GetQuran {
  final QuranRepository repository;

  GetQuran(this.repository);

  Future<Either<AppException, SurahModel>> call(String id) async {
    return await repository.getQuran(id: id);
  }
}
