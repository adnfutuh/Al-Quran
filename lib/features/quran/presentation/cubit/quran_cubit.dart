import 'package:alquran_app/core/core.dart';
import 'package:alquran_app/features/quran/data/models/list_surah_model.dart';
import 'package:alquran_app/features/quran/data/models/surah_model.dart';
import 'package:alquran_app/features/quran/domain/usecases/get_quran.dart';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'quran_state.dart';
part 'quran_cubit.freezed.dart';

@singleton
class QuranCubit extends Cubit<QuranState> {
  final GetQuran getQuran;
  QuranCubit(this.getQuran) : super(const QuranState.initial());

  void getQuranData(String id) async {
    emit(const QuranState.loading());
    final result = await getQuran(id);
    result.fold(
      (error) {
        emit(QuranState.error(error: error));
      },
      (result) => emit(QuranState.success(surahModel: result)),
    );
  }
}

@singleton
class ListQuranCubit extends Cubit<ListQuranState> {
  final GetListQuran getListQuran;
  ListQuranCubit(this.getListQuran) : super(const ListQuranState.initial());

  void getListQuranData(String id) async {
    emit(const ListQuranState.loading());
    final result = await getListQuran(id);
    result.fold(
      (error) {
        emit(ListQuranState.error(error: error));
      },
      (result) => emit(ListQuranState.success(listSurahModel: result)),
    );
  }
}
