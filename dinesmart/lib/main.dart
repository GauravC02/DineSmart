// main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'splashscreen.dart';
import 'login.dart';
import 'signup.dart';
import 'settings.dart';
import 'theme.dart';
import 'dashboard.dart';
import 'restaurantdine.dart';
import 'restaurants.dart';

void main() {
  runApp(
    ChangeNotifierProvider<ThemeNotifier>(
      create: (_) => ThemeNotifier(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, themeNotifier, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Dine-Smart',
          theme: themeNotifier.currentTheme,
          home: SplashScreen(),
          routes: {
            '/login': (context) => LoginPage(),
            '/signup': (context) => SignupPage(),
            '/settings': (context) => SettingsPage(),
            '/dashboard': (context) => DashboardPage(),
            '/restaurant_profile': (context) => RestaurantProfilePage(
                restaurant:
                    ModalRoute.of(context)!.settings.arguments as Restaurant),
          },
        );
      },
    );
  }
}
