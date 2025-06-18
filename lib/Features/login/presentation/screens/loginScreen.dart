import 'package:auvnet_flutter_task/Core/routes_manager/app_routes.dart';
import 'package:auvnet_flutter_task/Core/utils/customElevatedButton.dart';
import 'package:auvnet_flutter_task/Features/signup/presentation/screen/signupScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Core/utils/SharedPreferencesUtils.dart';
import '../../../../Core/utils/customTextFIeld.dart';
import '../../../../Core/utils/my_colors.dart';
import '../../../../Core/validator.dart';
import '../bloc/login_bloc.dart';
import '../bloc/login_events.dart';
import '../bloc/login_states.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.whiteColor,
      body: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state.loginRequestState == LoginRequestState.success) {
            
            Navigator.pushReplacementNamed(context, AppRoutes.homeRoute);
          } else if (state.loginRequestState == LoginRequestState.error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.failures?.message ?? "Unknown error"),
              ),
            );
          } else if (state.loginRequestState == LoginRequestState.loading) {
            Center(
              child: CircularProgressIndicator(
                color: ColorManager.primaryColor,
              ),
            );
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Image.asset(
                          'assets/images/nawel.png',
                          width: 336.w,
                          height: 336.h,
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(height: 32),

                      customTextFIeld(
                        textController: emailController,
                        prefixIcon: Icon(
                          Icons.email_outlined,
                          color: Colors.grey,
                        ),
                        hintText: 'mail',
                        validator: (p0) => AppValidators.validateEmail(p0),
                      ),
                      SizedBox(height: 32.h),

                      customTextFIeld(
                        isObscureText: true,
                        textController: passwordController,
                        prefixIcon: Icon(
                          CupertinoIcons.lock,
                          color: Colors.grey,
                        ),
                        hintText: "Password",
                        validator: (p0) => AppValidators.validatePassword(p0),
                      ),
                      const SizedBox(height: 32),
                      CustomElevatedbutton(
                        text: "Log In",
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            BlocProvider.of<LoginBloc>(context).add(
                              LoginButtonPressed(
                                email: emailController.text.trim(),
                                password: passwordController.text.trim(),
                              ),
                            );
                          }
                        },
                      ),

                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (_) => SignUpScreen()),
                          );
                        },

                        child: const Text(
                          'create an account?',
                          style: TextStyle(color: ColorManager.primaryColor),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
