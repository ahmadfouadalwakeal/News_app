import 'package:either_dart/either.dart';
import 'package:ixtask/domain/repositories/AuthRepository.dart';

import '../../data/authntiction/models/FailureClass.dart';
import '../../data/authntiction/models/UserData.dart';

class LoginUseCase {
  final AuthRepository authRepository;

  LoginUseCase(this.authRepository);

  Future<Either<Failure, String>> invoke(UserData userData) {
    print("LoginUseCase ${userData.toString()}");

    return authRepository.login(userData);
  }
}
