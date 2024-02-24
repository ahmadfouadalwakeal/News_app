import 'package:get_it/get_it.dart';
import 'package:ixtask/api/ApiManager.dart';
import 'package:ixtask/data/news/datasource/NewsRemoteSource.dart';
import 'package:ixtask/data/news/repositories/NewsRepositoryImpl.dart';
import 'package:ixtask/domain/repositories/NewsRepository.dart';
import 'package:ixtask/domain/usecase/GetNewsUseCase.dart';
import 'package:ixtask/domain/usecase/GetUserUseCase.dart';
import 'package:ixtask/domain/usecase/NewsSearchUseCase.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/authntiction/datasource/DataSource.dart';
import '../data/authntiction/repositories/AuthRepositoryImpl.dart';
import '../domain/repositories/AuthRepository.dart';
import '../domain/usecase/LoginUseCase.dart';

GetIt sl = GetIt.instance;

Future<void> serviceLocator() async {
  _api();
  _dataSources();
  _repositories();
  _useCase();

  SharedPreferences sharedPref = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPref);
}

void _api() {
  sl.registerLazySingleton<ApiManager>(
    () => ApiManager(),
  );
}

void _dataSources() {
  sl.registerLazySingleton<DataSource>(
    () => DataSourceImpl(sl()),
  );
  sl.registerLazySingleton<NewsRemoteSource>(
    () => NewsRemoteSourceImpl(sl()),
  );
}

void _repositories() {
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(sl()),
  );
  sl.registerLazySingleton<NewsRepository>(
    () => NewsRepositoryImpl(sl()),
  );
}

void _useCase() {
  sl.registerLazySingleton(() => LoginUseCase(sl()));
  sl.registerLazySingleton(() => GetUserUseCase(sl()));
  sl.registerLazySingleton(() => GetNewsUseCase(sl()));
  sl.registerLazySingleton(() => NewsSearchUseCase(sl()));

}
