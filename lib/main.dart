
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'Features/login/Domain/use_cases/login_useCase.dart';

import 'Features/login/Data/repository/login_repositoryImpl.dart';
import 'Features/login/Domain/use_cases/login_useCase.dart';
import 'Features/login/presentation/bloc/login_bloc.dart';
import 'Features/signup/Domain/use_cases/signup_usecase.dart';
import 'Features/signup/presentation/bloc/signup_bloc.dart';
import 'Features/signup/presentation/screen/signupScreen.dart';

final supabase = Supabase.instance.client;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://oitquyyyqvytadddcgri.supabase.co',
    anonKey: 'your-key-here',
  );

  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SignupBloc>(
          create: (context) => SignupBloc(
            SignUpUseCase(
              SignUpRepositoryImpl(
                SignupRemoteDataSource(client: supabase),
              ),
            ),
          ),
        ),
        BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(
            LoginUseCase(
              LoginRepositoryImpl(
                LoginRemoteDataSource(client: supabase),
              ),
            ),
          ),
        ),
      ],
      child: ScreenUtilInit(
        designSize: Size(375, 812),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SignUpScreen(),
        ),
      ),
    );
  }
}
