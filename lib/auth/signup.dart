import 'package:facebook_project/auth/authentication_notifier.dart';
import 'package:facebook_project/auth/login.dart';
import 'package:facebook_project/widgets/my_button_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'app_routes.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController emailConroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  @override
  void initState() {
    emailConroller = TextEditingController();
    passwordcontroller = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final AuthenticationNotifier authenticationNotifier =
        Provider.of<AuthenticationNotifier>(context, listen: false);
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          actions: [
            Icon(Icons.sentiment_very_satisfied,size: 60,color: Colors.blue,)
          ],
          backgroundColor: Colors.white,
          leading: IconButton(icon: Icon(Icons.navigate_before_outlined,size: 40,color: Colors.black,), onPressed: () { 
            Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
           },),
          elevation: 0,
        ),
        body: ListView(
          children: [
            Container(
              margin: EdgeInsetsDirectional.only(top: 10),
              child: Column(children: [
                Image.asset(
                  "assets/images/pngegg.png",
                  height: 300,
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    TextField(
                      controller: emailConroller,
                      decoration: InputDecoration(
                          hintText: "Enter email",
                          fillColor: Colors.grey[100],
                          filled: true,
                          hintStyle:
                              TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20.0),
                          )),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: passwordcontroller,
                      decoration: InputDecoration(
                          hintText: "Enter password",
                          fillColor: Colors.grey[100],
                          filled: true,
                          hintStyle:
                              TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20.0),
                          )),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Expanded(
                            child: MyButtonWidget(
                              text: "Sign up",
                              color: Colors.blue,
                              onPress: () async {
                                String email = emailConroller.text;
                                String password = passwordcontroller.text;

                                if (email.isNotEmpty && password.isNotEmpty) {
                                  await authenticationNotifier.signup(
                                      email: email, password: password);
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text("Fill the credentials")));
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(AppRoutes.LoginRoute);
                        },
                        child: Text(
                          "Already have an account? Login",
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        )),
                  ],
                ),
              ]),
            ),
          ],
        ));
  }
}
