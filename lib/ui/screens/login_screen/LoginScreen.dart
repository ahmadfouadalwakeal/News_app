import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ixtask/ui/responsive-ui/ui_components/InfoWidget.dart';
import 'package:ixtask/ui/screens/home_screen/HomeScreen.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../../generated/l10n.dart';
import '../../Bloc_Auth/auth_bloc.dart';
import '../../widget/Custom_Button.dart';
import '../../widget/Custom_textfield.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  static String id = 'Login Screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formkey = GlobalKey();
  String? email, password;
  bool isLoading = false;
  bool rememberme = false;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  _login() {
    if (formkey.currentState!.validate()) {
      BlocProvider.of<AuthBloc>(context)
          .add(LoginEvent(email!, password!, rememberme));

      print("Login $email $password $rememberme");
    }
    print("Login im here $password $rememberme");
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(buildWhen: (previousState, state) {
      if (state is LogedState) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      }
      return true;
    }, builder: (context, state) {
      return InfoWidget(builder: (context, deviceInfo) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Form(
              key: formkey,
              child: ListView(
                children: [
                  SizedBox(
                    height: 140,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 100,
                      ),
                      Text(
                        S.of(context).Login,
                        style: TextStyle(
                          fontSize: 32,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Custom_TextFormField(
                    onchanged: (data) {
                      email = data;
                    },
                    textempty: 'Enter valid email ',
                    textvalid: 'Invalid email',
                    hinitText: S.of(context).Email,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Custom_TextFormField(
                    obscureText: true,
                    onchanged: (data) {
                      password = data;
                    },
                    textempty: 'Enter valid password',
                    textvalid: 'Invalid password',
                    hinitText: S.of(context).Password,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Checkbox(
                          checkColor: Colors.white,
                          activeColor: Colors.blue,
                          value: rememberme,
                          onChanged: (val) {
                            setState(() {
                              rememberme = val!;
                            });
                          }),
                      Text(S.of(context).RememberMe),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomButton(
                    onTap: () async {
                      _login();
                    },
                    text: S.of(context).Login,
                  ),
                ],
              ),
            ),
          ),
        );
      });
    });
  }
}
