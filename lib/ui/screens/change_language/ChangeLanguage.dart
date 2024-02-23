import 'package:flutter/material.dart';
import 'package:ixtask/ui/responsive-ui/ui_components/InfoWidget.dart';
import 'package:ixtask/ui/widget/Custom_Button.dart';

import '../../../generated/l10n.dart';

class ChangeLanguage extends StatefulWidget {
  const ChangeLanguage({super.key});

  @override
  State<ChangeLanguage> createState() => _ChangeLanguageState();
}

class _ChangeLanguageState extends State<ChangeLanguage> {
  bool Arabic = false;
  bool English = true;

  @override
  Widget build(BuildContext context) {
    return InfoWidget(builder: (context, deviceInfo) {
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            children: [
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
                height: 64,
              ),
              Row(
                children: [
                  Checkbox(
                      checkColor: Colors.white,
                      activeColor: Colors.blue,
                      value: English,
                      onChanged: (val) {
                        setState(() {
                          English = val!;
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
                      value: Arabic,
                      onChanged: (val) {
                        setState(() {
                          Arabic = val!;
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
                height: 64,
              ),
              CustomButton(
                onTap: () {},
                text: S.of(context).Save,
              )
            ],
          ),
        ),
      );
    });
  }
}
