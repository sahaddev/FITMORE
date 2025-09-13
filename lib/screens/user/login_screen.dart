import 'package:e_commerce/Widgets/h1_headline.dart';
import 'package:e_commerce/Widgets/mainbutton.dart';
import 'package:e_commerce/Widgets/text_field_reg.dart';
import 'package:e_commerce/application/core/widgets/appbar.dart';
import 'package:e_commerce/application/features/auth/getx/auth_get.dart';
import 'package:e_commerce/data_base/function/user_functions.dart';
import 'package:e_commerce/screens/user/registrationscreen.dart';
import 'package:e_commerce/service/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Widgets/bottom_navigator.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordControlle = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final authGet = Get.put(AuthGet());

  @override
  Widget build(BuildContext context) {
    userr.getAlluser();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      appBar: mainTitle('Sign In'),
      body: Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            const SizedBox(height: 50),
            const H1headline(text: 'Welcome Back'),
            const SizedBox(height: 12),
            const TextInResgistration(
                text: 'SignIn with your email Id and password'),
            const SizedBox(height: 70),
            TextFieldInReg(
              icon: Icons.email,
              labelText: "Email",
              hintText: 'Enter your email',
              validatorText: 'Field is empty',
              keyboardType: TextInputType.emailAddress,
              obscureText: false,
              maxLength: null,
              nameController: _emailController,
            ),
            const SizedBox(height: 20),
            TextFieldInReg(
              icon: Icons.lock,
              labelText: "Password",
              hintText: 'Enter your password',
              validatorText: 'Field is empty',
              keyboardType: TextInputType.text,
              obscureText: false,
              maxLength: null,
              nameController: _passwordControlle,
            ),
            const SizedBox(height: 40),
            Button(
              text: 'SIGN IN',
              onPressedCallback: () async {
                if (formKey.currentState!.validate()) {
                  final Map<String, dynamic> value = await UserApiService()
                      .login(_emailController.text, _passwordControlle.text);
                  if (value['login'] == false) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: Colors.red,
                      margin: const EdgeInsets.all(15),
                      content: Text(value['message']),
                    ));
                  } else {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: ((ctx) => const BottomNavigator())),
                        (Route<dynamic> route) => false);
                  }
                }
              },
            ),
            const SizedBox(height: 90),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const TextInResgistration(text: 'Dont have account?'),
                const SizedBox(width: 5),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctx) => const RegScreen(),
                    ));
                  },
                  child: const Text(
                    'SignUp',
                    style: TextStyle(color: Colors.red, fontSize: 15),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
