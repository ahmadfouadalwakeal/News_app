import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:ixtask/ui/Bloc_Auth/auth_bloc.dart';
import 'package:ixtask/ui/screens/splash_screen/SplashScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../di/Locator.dart';
import '../generated/l10n.dart';
import '../local/local.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await serviceLocator();
  await sl.allReady();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => LocaleModel(),
        child: Consumer<LocaleModel>(
            builder: (context, localeModel, child) =>
                MultiBlocProvider(
                  providers: [
                    BlocProvider<AuthBloc>(create: (BuildContext context) => AuthBloc()),
                  ],
                  child: MaterialApp(
                    locale: localeModel.locale,
                    localizationsDelegates: [
                      S.delegate,
                      GlobalCupertinoLocalizations.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                    ],
                    supportedLocales: S.delegate.supportedLocales,
                    debugShowCheckedModeBanner: false,
                    theme: ThemeData(
                      brightness: Brightness.dark,
                    ),
                    home: SplashScreen(),
                  ),
                ),

        ),
      );






  }
}
