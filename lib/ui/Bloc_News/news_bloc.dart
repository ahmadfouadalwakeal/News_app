import 'package:bloc/bloc.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/foundation.dart';
import 'package:ixtask/domain/usecase/GetNewsUseCase.dart';
import 'package:ixtask/domain/usecase/NewsSearchUseCase.dart';
import 'package:meta/meta.dart';

import '../../data/news/models/ActicleModel.dart';
import '../../di/Locator.dart';

part 'news_event.dart';

part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc() : super(NewsInitialState()) {
    on<NewsListStarted>(_onStart);
    on<NewsListSearch>((_onSearch));
  }

  void _onStart(NewsListStarted event, Emitter<NewsState> emit) async {
    emit(LoadingNewsState());
    var data = await sl.get<GetNewsUseCase>().invoke(event.category);
    data.fold((left) => emit(NewsErrorState(left.message!)),
        (right) => emit(LoadedState(right)));
  }

  void _onSearch(NewsListSearch event, Emitter<NewsState> emit) async {
    emit(LoadingNewsState());
    var data = await sl.get<NewsSearchUseCase>().invoke(event.query);
    emit(LoadedState(data));
  }
}
