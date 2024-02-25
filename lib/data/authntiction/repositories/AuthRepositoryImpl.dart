import 'package:either_dart/either.dart';
import 'package:ixtask/data/authntiction/models/FailureClass.dart';

import '../../../domain/repositories/AuthRepository.dart';
import '../datasource/DataSource.dart';
import '../models/UserData.dart';

class AuthRepositoryImpl implements AuthRepository {
  final DataSource local;

  AuthRepositoryImpl(this.local);

  @override
  Future<Either<Failure, String>> login(UserData userData) async {
    print("LoginRepo ${userData.toString()}");

    return local.setUserData(userData);
  }

  @override
  Future<Either<Failure, UserData>> fetchUserData() async {
    return local.getUserData();
  }

  @override
  Future<Either<Failure, String>> logout() {
    return local.removeUser();
  }
}
