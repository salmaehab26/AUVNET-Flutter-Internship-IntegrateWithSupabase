import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return BlocProvider(
      create: (_) => SignupBloc(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: BlocConsumer<SignupBloc, SignupState>(
              listener: (context, state) {
                if (state is SignupSuccess) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Signup Successful")),
                  );
                  // Navigate to home or next screen
                } else if (state is SignupFailure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.message)),
                  );
                }
              },
              builder: (context, state) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/nawel.png', height: 100),
                    const SizedBox(height: 20),
                    _buildTextField(Icons.email, 'Mail', emailController),
                    const SizedBox(height: 10),
                    _buildTextField(Icons.lock, 'Password', passwordController, obscureText: true),
                    const SizedBox(height: 10),
                    _buildTextField(Icons.lock, 'Confirm Password', confirmPasswordController, obscureText: true),
                    const SizedBox(height: 20),
                    state is SignupLoading
                        ? CircularProgressIndicator()
                        : ElevatedButton(
                      onPressed: () {
                        if (passwordController.text == confirmPasswordController.text) {
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
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple,
                        minimumSize: const Size(double.infinity, 50),
                      ),
                      child: const Text('Sign up', style: TextStyle(color: Colors.white)),
                    ),
                    const SizedBox(height: 10),
                    TextButton(
                      onPressed: () {},
                      child: const Text('Create an account', style: TextStyle(color: Colors.blue)),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(IconData icon, String hintText, TextEditingController controller,
      {bool obscureText = false}) {
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
