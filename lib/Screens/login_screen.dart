import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_sample/Screens/home_screen.dart';
import 'package:login_sample/Screens/password_reset_screen.dart';
import 'package:login_sample/Screens/signup_screen.dart';
import 'package:login_sample/Widgets/loginscreen_widgets.dart';
import 'package:login_sample/main.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE3F1F7),
      body: Padding(
        padding: const EdgeInsets.all(0),
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.35,
                  child: const Center(
                    child: CircleAvatar(
                      radius: 60,
                      backgroundColor: Color(0xFF140777),
                      child: Icon(Icons.insights_outlined,size: 80,color: Color(0xFFE3F1F7),),
                    ),
                  ),
                ),
                CustomTextField(
                    controller: emailController,
                    validator: (value) {
                      if (value != null &&
                          RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value)) {
                        return null;
                      } else {
                        return 'Please enter valid email';
                      }
                    },
                    label: 'Email Address',
                    hint: 'Username@gmail.com',
                    icon: Icons.mail_outline),
                CustomTextField(
                  controller: passwordController,
                  validator: (value) {
                    if (value != null && value.length >= 6) {
                      return null;
                    } else {
                      return 'Password must contain atleast 6 characters';
                    }
                  },
                  label: 'Password',
                  hint: '..........',
                  isPasswordField: true,
                  obscureText: true,
                  icon: Icons.lock_outline,
                  
                ),
                GestureDetector(
                  onTap: () async {
                    if (formkey.currentState!.validate()) {
                      await prefs.setStringList('userInfo',
                          [emailController.text, passwordController.text]);

                      userInfo = [
                        emailController.text,
                        passwordController.text
                      ];

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeScreen()));
                    }
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 15,horizontal:20),
                    height: 60,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: const Color(0xFF140777),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Text(
                      'Login',
                      style: GoogleFonts.comfortaa(
                        color: const Color(0xFFE3F1F7),
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomTextButton(
                        buttonText: 'Signup',
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignupScreen()));
                        },
                      ),
                      CustomTextButton(buttonText: 'Forgot Password?',     onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const PasswordResetScreen()));
                        },),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
