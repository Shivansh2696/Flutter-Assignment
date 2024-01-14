import 'package:flutter/material.dart';
import 'package:flutter_assignment/userProvider.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController(text: "kminchelle");
  TextEditingController passwordController = TextEditingController(text: "0lelplR");

  Future<void> loginUser(BuildContext context) async {
    const String apiUrl = "https://dummyjson.com/auth/login";
    final String username = emailController.text;
    final String password = passwordController.text;

    final response = await http.post(
      Uri.parse(apiUrl),
      body: {
        'username': username,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      await Provider.of<UserProvider>(context, listen: false).login();
      Navigator.pushReplacementNamed(context, '/dashboardScreen');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Login Failed'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  Future<void> logoutUser(BuildContext context) async {
    await Provider.of<UserProvider>(context, listen: false).logout();
    Navigator.pushReplacementNamed(context, '/');
  }

  String? emailError;
  String? passwordError;

  void validateInputs(BuildContext context) {
    setState(() {
      emailError = validateEmail(emailController.text);
      passwordError = validatePassword(passwordController.text);

      if (emailError == null && passwordError == null) {
        loginUser(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'SignIn',
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.black12,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  errorText: emailError,
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  errorText: passwordError,
                ),
              ),
              const SizedBox(height: 16),
              FractionallySizedBox(
                widthFactor: 0.9,
                child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.lightBlue),
                  ),
                  onPressed: () {
                    validateInputs(context);
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                '------- OR -------',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              FractionallySizedBox(
                widthFactor: 0.9,
                child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.lightBlue),
                  ),
                  onPressed: () {
                    logoutUser(context);
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: Text(
                      'Logout',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String? validateEmail(String email) {
    if (email.isEmpty) {
      return 'Email is required';
    }
    return null;
  }

  String? validatePassword(String password) {
    if (password.isEmpty) {
      return 'Password is required';
    }
    return null;
  }
}
