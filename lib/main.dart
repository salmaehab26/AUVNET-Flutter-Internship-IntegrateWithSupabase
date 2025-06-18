
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'Core/MyBlocObserver.dart';
import 'Core/routes_manager/app_routes.dart';
import 'Core/routes_manager/routes_generators.dart';
import 'Core/utils/SharedPreferencesUtils.dart';
import 'Features/Home/Data/data_sources/local dataSource/LocalDataSourceImpl.dart';
import 'Features/Home/Data/data_sources/remoteDataSource/RestaurantRemoteDataSource.dart';
import 'Features/Home/Data/repository/restaurant_RepositoryImpl.dart';
import 'Features/Home/Domain/use_cases/restaurants_UseCase.dart';
import 'Features/Home/presentation/bloc/home_bloc.dart';
import 'Features/Home/presentation/bloc/home_events.dart';
import 'Features/login/Data/data_sources/remote dataSource/login_dataSource.dart';
import 'Features/login/Data/repository/login_repositoryImpl.dart';
import 'Features/login/Domain/use_cases/login_useCase.dart';
import 'Features/login/presentation/bloc/login_bloc.dart';
import 'Features/signup/Data/data_sources/remote dataSource/signup_dataSource.dart';
import 'Features/signup/Data/repository/signup_repositoryImpl.dart';
import 'Features/signup/Domain/use_cases/signup_usecase.dart';
import 'Features/signup/presentation/bloc/signup_bloc.dart';


final supabase = Supabase.instance.client;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferenceUtils.init();
  Bloc.observer = MyBlocObserver();
  final prefs = await SharedPreferences.getInstance();
  final onboardingShown = prefs.getBool('onboarding_shown') ?? false;
  await Supabase.initialize(
    url: 'https://oitquyyyqvytadddcgri.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9pdHF1eXl5cXZ5dGFkZGRjZ3JpIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTAxODQ3NzEsImV4cCI6MjA2NTc2MDc3MX0.7_jgOFklLxIUwoxif0eRPdU-U8j9lQ53oae0jXtki1w',
  );

  runApp(MyApp(showOnboarding: !onboardingShown));
}

class MyApp extends StatelessWidget {
  final bool showOnboarding;
  const MyApp({required this.showOnboarding});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SignupBloc>(
          create: (context) => SignupBloc(
            SignUpUseCase(
              signUpRepositoryImpl(
                signupRemoteDataSource(client: supabase),
              ),
            ),
          ),
        ),
        BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(
            LoginUseCase(
              LoginRepositoryImpl(
                loginRemoteDataSource(client: supabase),
              ),
            ),
          ),
        ),
        BlocProvider<RestaurantBloc>(
          create: (context) => RestaurantBloc(
            GetRestaurantsUseCase(
              RestaurantRepositoryImpl(localDataSource: RestaurantLocalDataSourceImpl(),
               remoteDataSource:     RestaurantRemoteDataSource(client: supabase),
              ),
            ),
          )..add(LoadRestaurantsEvent()),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        child: MaterialApp(
          onGenerateRoute: RoutesGenerator.getRoutes,
          debugShowCheckedModeBanner: false,
          initialRoute: showOnboarding? AppRoutes.onboardingRoute:AppRoutes.splashRoute,
        ),
      ),
    );
  }
}
