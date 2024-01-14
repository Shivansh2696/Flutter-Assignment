import 'package:flutter/material.dart';
import 'package:flutter_assignment/userProvider.dart';
import 'package:flutter_assignment/loginPage.dart';
import 'package:flutter_assignment/dashboardScreen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.getInstance().then((prefs) {
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    runApp(
      ChangeNotifierProvider(
        create: (context) => UserProvider(isLoggedIn),
        child: const MyApp(),
      ),
    );
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login Page',
      home: Consumer<UserProvider>(
        builder: (context, userProvider, _) {
          return userProvider.isLoggedIn ? const DashboardScreen() : const LoginPage();
        },
      ),
      routes: {
        '/dashboardScreen': (context) => const DashboardScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
