import 'package:either_dart/either.dart';
import 'package:ixtask/domain/repositories/AuthRepository.dart';

import '../../data/authntiction/models/FailureClass.dart';
import '../../data/authntiction/models/UserData.dart';

class LogoutUseCase {
  final AuthRepository _authRepository;

  LogoutUseCase(this._authRepository);

  Future<Either<Failure, String>> invoke() {

    return _authRepository.logout();
  }
}
