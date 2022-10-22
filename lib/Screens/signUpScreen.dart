import 'package:basic_authentication_flutter_challenge/Screens/home.dart';
import 'package:flutter/material.dart';
import 'package:basic_authentication_flutter_challenge/Services/api.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    userNameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.teal),
      home: Scaffold(
          appBar: AppBar(
            title: Text('login screen'),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30.0),
                child: Form(
                    child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: TextFormField(
                        controller: userNameController,
                        keyboardType: TextInputType.name,
                        decoration: const InputDecoration(
                          labelText: "username",
                          hintText: "enter username",
                          prefixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: TextFormField(
                        controller: passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          labelText: "password",
                          hintText: "enter password",
                          prefixIcon: Icon(Icons.password),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    GestureDetector(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 35),
                        child: MaterialButton(
                          minWidth: double.infinity,
                          onPressed: () async {
                            Authentication.username =
                                userNameController.text.toString();
                            Authentication.password =
                                passwordController.text.toString();
                            Authentication.userId =
                                await Authentication.getUserId();
                            Authentication.accessToken =
                                await Authentication.getAccessToken();
                            if (Authentication.accessToken.length >= 50)
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const homePageScreen()),
                              );
                            else
                              print("cant log in");
                          },
                          child: Text('login'),
                          color: Colors.teal,
                          textColor: Colors.white,
                        ),
                      ),
                    )
                  ],
                )),
              ),
            ],
          )),
    );
  }
}
//username: jarmatage8
//password: xwNEVYPnI
