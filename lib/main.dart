import 'package:flutter/material.dart';
import 'package:flutter_api/Models/Screens/Home_screen/Home_screen.dart';
import 'package:flutter_api/Models/Screens/Home_screen/Home_screenState.dart';
import 'package:flutter_api/Models/Screens/Splash_models/splash_screen.dart';
import 'package:flutter_api/Models/Screens/Splash_models/splash_state.dart';
import 'package:flutter_api/Models/Screens/details_model/detailPage.dart';
import 'package:flutter_api/Models/Screens/details_model/detailState.dart';
import 'package:flutter_api/Models/Screens/login_module/login_page.dart';
import 'package:flutter_api/Models/Screens/login_module/login_state.dart';
import 'package:flutter_api/common/themeProvider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();
  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
        await themeChangeProvider.darkThemePreference.getTheme();
  }

  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        return themeChangeProvider;
      },
      child: Consumer<DarkThemeProvider>(
        builder: (context, value, child) {
          return MaterialApp(
              initialRoute: '/',
              navigatorKey: navigatorKey,
              routes: {
                LoginPage.id: (context) => ChangeNotifierProvider(
                      create: (_) => LoginState(),
                      child: LoginPage(),
                    ),
                '/homeScreen': (context) => ChangeNotifierProvider(
                      create: (_) => HomeScreenState(),
                      child: const HomeScreen(),
                    ),
                '/': (context) => ChangeNotifierProvider(
                      create: (_) => SplashState(),
                      child: const SplashScreen(),
                    ),
                '/detailPage': (context) => ChangeNotifierProvider(
                      create: (_) => DetailState(),
                      child:  const DetailPage(),
                    ),
              });
        },
      ),
    );
  }
}
