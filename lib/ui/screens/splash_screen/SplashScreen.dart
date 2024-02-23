import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ixtask/domain/usecase/GetUserUseCase.dart';
import 'package:ixtask/ui/responsive-ui/ui_components/InfoWidget.dart';
import 'package:ixtask/ui/screens/home_screen/HomeScreen.dart';
import 'package:ixtask/ui/screens/login_screen/LoginScreen.dart';

import '../../../di/Locator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(seconds: 3), () async {
      print("SlashScreen  init");
      final result = await sl.get<GetUserUseCase>().invoke();
      final sd = (result.isRight) ? {result.right.toString()} : {result.left.message};
      print("SlashScreen  $sd ");

      result.fold(
          (left) => Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => LoginScreen())),
          (right) => {
                if (right.rememberMe == true)
                  {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (_) => HomeScreen())),
                  }
                else
                  {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (_) => LoginScreen())),
                  }
              });
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InfoWidget(builder: (context, deviceInfo) {
      return Scaffold(
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.purple],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.edit,
                size: 50,
                color: Colors.white,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'IX Solutions',
                style: TextStyle(
                    fontSize: 32,
                    fontStyle: FontStyle.italic,
                    color: Colors.white),
              ),
            ],
          ),
        ),
      );
    });
  }
}
