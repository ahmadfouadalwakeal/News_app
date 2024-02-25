import 'package:either_dart/either.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/FailureClass.dart';
import '../models/UserData.dart';

String _EMAIL_KEY = "email";
String _PASSWORD_KEY = "password";
String _USER_STATES = "isLogin";

abstract class DataSource {
  Future<Either<Failure,UserData>> getUserData();
  Future<Either<Failure,String>> setUserData(UserData userData);
  Future<Either<Failure,String>> removeUser();
}

class DataSourceImpl implements DataSource {
  final SharedPreferences prefs;

   DataSourceImpl(this.prefs);

  @override
  Future<Either<Failure,UserData>> getUserData() async {

     var email = prefs.getString(_EMAIL_KEY);
     var password = prefs.getString(_PASSWORD_KEY);
     var userstates = prefs.getBool(_USER_STATES);
     if(userstates == null){
       return Left(Failure('UnAuthnticated'));
     }return Right(UserData(email: email , password: password , rememberMe: userstates)) ;

  }

  @override
  Future<Either<Failure,String>> setUserData(UserData userData) async{
    prefs.setString(_EMAIL_KEY, userData.email!);
    prefs.setString(_PASSWORD_KEY, userData.password!);
    prefs.setBool(_USER_STATES, userData.rememberMe!);
    return Right('Success');
  }

  @override
  Future<Either<Failure, String>> removeUser() async{
    prefs.setString(_EMAIL_KEY, "");
    prefs.setString(_PASSWORD_KEY, "");
    prefs.setBool(_USER_STATES, false);
    return Right("Removed");
  }
}
