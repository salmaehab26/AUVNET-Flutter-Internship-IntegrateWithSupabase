import 'package:auvnet_flutter_task/Core/utils/customElevatedButton.dart';
import 'package:auvnet_flutter_task/Core/utils/customTextFIeld.dart';
import 'package:auvnet_flutter_task/Features/login/presentation/screens/loginScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Core/utils/my_colors.dart';
import '../../../../Core/validator.dart';
import '../../../login/presentation/bloc/login_bloc.dart';
import '../../../login/presentation/bloc/login_states.dart';
import '../bloc/signup_bloc.dart';
import '../bloc/signup_events.dart';
import '../bloc/signup_states.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: BlocConsumer<SignupBloc, SignupState>(
            listener: (context, state) {
              if (state.signUpRequestState == SignUpRequestState.success) {
                Navigator.pushReplacementNamed(context, '/home');
              } else if (state.signUpRequestState == SignUpRequestState.error) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.failures?.message ?? "Unknown error")),
                );
              }else if (state.signUpRequestState == SignUpRequestState.loading) {
                Center(
                  child: CircularProgressIndicator(
                    color: ColorManager.primaryColor,
                  ),
                );
              }
            },
            builder: (context, state) {
              return Column(
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
                  const SizedBox(height: 20),
                  customTextFIeld(
                    textController: emailController,
                    prefixIcon: Icon(Icons.email_outlined, color: Colors.grey),
                    hintText: 'mail',
                    validator: (p0) => AppValidators.validateEmail(p0),
                  ),
                   SizedBox(height: 20),
                  customTextFIeld(
                    isObscureText: true,

                    textController: passwordController,
                    prefixIcon: Icon(CupertinoIcons.lock, color: Colors.grey),
                    hintText: 'Password',
                    validator: (p0) => AppValidators.validatePassword(p0),
                  ),
                   SizedBox(height: 20),

                  customTextFIeld(
                    textController: confirmPasswordController,
                    prefixIcon: Icon(CupertinoIcons.lock, color: Colors.grey),
                    hintText: 'Confirm Password',
                    isObscureText: true,

                    validator: (p0) => AppValidators.validatePassword(p0),
                  ),

                  const SizedBox(height: 20),
                  CustomElevatedbutton(
                        onPressed: () {
                          if (passwordController.text ==
                              confirmPasswordController.text) {
                            BlocProvider.of<SignupBloc>(context).add(
                              SignupButtonPressed(
                                email: emailController.text.trim(),
                                password: passwordController.text.trim(),
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Passwords do not match")),
                            );
                          }
                        },
                        text: "Sign up",
                      ),
                  const SizedBox(height: 10),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => LoginScreen()),
                      );
                    },

                    child: const Text(
                      'Have an account?',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
    IconData icon,
    String hintText,
    TextEditingController controller, {
    bool obscureText = false,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        hintText: hintText,
        border: OutlineInputBorder(),
      ),
    );
  }
}
