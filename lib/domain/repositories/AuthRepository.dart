import 'package:either_dart/either.dart';

import '../../data/authntiction/models/FailureClass.dart';
import '../../data/authntiction/models/UserData.dart';

abstract class AuthRepository {
  Future<Either<Failure, String>> login(UserData userData);

  Future<Either<Failure, UserData>> fetchUserData();
}
