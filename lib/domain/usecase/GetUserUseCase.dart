import 'package:either_dart/either.dart';
import 'package:ixtask/domain/repositories/AuthRepository.dart';

import '../../data/authntiction/models/FailureClass.dart';
import '../../data/authntiction/models/UserData.dart';

class GetUserUseCase {
  final AuthRepository authRepository;

  GetUserUseCase(this.authRepository);

  Future<Either<Failure, UserData>> invoke() async{
    return  authRepository.fetchUserData();
  }
}
