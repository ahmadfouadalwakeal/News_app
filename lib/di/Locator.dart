import 'package:get_it/get_it.dart';
import 'package:ixtask/domain/usecase/GetUserUseCase.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/authntiction/datasource/DataSource.dart';
import '../data/authntiction/repositories/AuthRepositoryImpl.dart';
import '../domain/repositories/AuthRepository.dart';
import '../domain/usecase/LoginUseCase.dart';

GetIt sl = GetIt.instance;

Future<void> serviceLocator() async {

  _dataSources();
  _repositories();
  _useCase();

  SharedPreferences sharedPref = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(()=>sharedPref);
}

void _dataSources() {
  sl.registerLazySingleton<DataSource>(
    () => DataSourceImpl(sl()),
  );
}

void _repositories() {
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(sl()),
  );
}

void _useCase() {
  sl.registerLazySingleton(() => LoginUseCase(sl()));
  sl.registerLazySingleton(() => GetUserUseCase(sl()));
}
