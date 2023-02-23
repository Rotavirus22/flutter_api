import 'package:flutter/material.dart';
import 'package:flutter_api/Models/Screens/Splash_models/splash_state.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final splashState = Provider.of<SplashState>(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
                tag: 'logo',
                child: Container(
                  height: 200,
                    child: Image.asset(
                        'assets/images/—Pngtree—soccer ball in goal 2022_8732685.png'))),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
