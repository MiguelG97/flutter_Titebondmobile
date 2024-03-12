import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:mobile/core/theme/themes.dart';
import 'package:mobile/modules/auth/presenter/controllers/auth_bloc/auth_bloc.dart';
import 'package:mobile/modules/auth/presenter/controllers/auth_bloc/auth_states.dart';
import 'package:mobile/modules/auth/presenter/screens/login_screen.dart';
import 'package:mobile/modules/auth/presenter/screens/onboarding_screen.dart';
import 'package:mobile/modules/store/presenter/home/screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'core/settings/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final bool showOnbarding = prefs.getBool("showOnboarding") ?? true;

  runApp(App(
    showOnbarding: showOnbarding,
  ));
  FlutterNativeSplash.remove();
}

class App extends StatelessWidget {
  const App({super.key, required this.showOnbarding});
  final bool showOnbarding;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MThemes.lightTheme,
      darkTheme: MThemes.darkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(
            create: (context) => AuthBloc(),
          )
        ],
        child: BlocBuilder<AuthBloc, Auth_states>(
          builder: (context, state) {
            User? user = FirebaseAuth.instance.currentUser;
            print(user);
            if (showOnbarding) {
              return OnboardingScreen();
            } else if (user == null) {
              return Loggin_Screen();
            } else {
              return HomeScreen();
            }
          },
        ),
      ),
    );
  }
}
