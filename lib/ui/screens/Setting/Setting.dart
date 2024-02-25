import 'package:flutter/material.dart';
import 'package:ixtask/domain/usecase/LogoutUseCase.dart';
import 'package:ixtask/ui/main.dart';
import 'package:ixtask/ui/responsive-ui/ui_components/InfoWidget.dart';
import 'package:ixtask/ui/screens/login_screen/LoginScreen.dart';
import 'package:ixtask/ui/widget/Custom_Button.dart';

import '../../../di/Locator.dart';
import '../../../generated/l10n.dart';
import '../../../local/LanguageConstants.dart';
import '../../../local/local.dart';
import 'package:provider/provider.dart';

class ChangeLanguage extends StatefulWidget {
  const ChangeLanguage({super.key});

  @override
  State<ChangeLanguage> createState() => _ChangeLanguageState();
}

class _ChangeLanguageState extends State<ChangeLanguage> {
   var selectedLocale = "";

   void _changeLanguage(String languageCode ) async {
     Locale _locale = await setLocale(languageCode);
     MyApp.setLocale(context , _locale);
   }

  @override
  Widget build(BuildContext context) {
     if(selectedLocale == ""){
       selectedLocale = Localizations.localeOf(context).toString();
     }
    return InfoWidget(builder: (context, deviceInfo) {
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(children: [
           const SizedBox(height: 32),
           DecoratedBox(
             decoration: BoxDecoration(
               border: Border(
                   bottom: BorderSide(
                     color: Colors.white10,
                     width: 1.0,
                   )),
             ),
             child: Text(
               S.of(context).titlelanguage,
               style: TextStyle(
                 fontSize: 32,
                 color: Colors.white,
                 fontWeight: FontWeight.bold,
               ),
             ),
           ),
           const SizedBox(
             height: 32,
           ),
           Row(
             children: [
               Checkbox(
                   checkColor: Colors.white,
                   activeColor: Colors.blue,
                   value: selectedLocale == ENGLISH,
                   onChanged: (val) {
                     setState(() {
                      selectedLocale = ENGLISH;
                     });
                   }),
               Text(
                 S.of(context).English,
                 style: TextStyle(
                   fontStyle: FontStyle.italic,
                   fontSize: 22,
                 ),
               ),
             ],
           ),
           const SizedBox(
             height: 32,
           ),
           Row(
             children: [
               Checkbox(
                   checkColor: Colors.white,
                   activeColor: Colors.blue,
                   value: selectedLocale == ARABIC ,
                   onChanged: (val) {
                     setState(() {
                      selectedLocale = ARABIC;
                     });
                   }),
               Text(
                 S.of(context).Arabic,
                 style: TextStyle(
                   fontStyle: FontStyle.italic,
                   fontSize: 22,
                 ),
               ),
             ],
           ),
           const SizedBox(
             height: 32,
           ),
           CustomButton(
             onTap: () {
                _changeLanguage(selectedLocale);
                Navigator.pop(context);
             },
             text: S.of(context).Save,
           ),
            const SizedBox(height: 20,),
            CustomButton(
              onTap: (){
                sl.get<LogoutUseCase>().invoke();
                Navigator.of(context, rootNavigator: true)
                    .pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return  LoginScreen();
                    },
                  ),
                      (_) => false,
                );
              },
              text: S.of(context).logout,
            ),
             ],)

          ),
        );
    });
  }
}
