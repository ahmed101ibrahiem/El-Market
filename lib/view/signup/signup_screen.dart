import 'package:e_commerce/core/shared/component/text_form_field.dart';
import 'package:flutter/material.dart';

import '../../core/shared/auth_button.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage("assets/background/background.png"),
            fit: BoxFit.cover,
          ),
          color: Colors.white.withOpacity(0.1),
        ),
        child: Container(
          width: double.infinity,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 60.0, right: 15, left: 15),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: const [
                          Text(
                            "EL-MARKET",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 35,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Your Best Place For Online Shopping .",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              //fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 60.0,),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 15.0),
                            child: CustomTextField(
                              keyboaredTybe: TextInputType.text,
                              controller: nameController,
                              label: "Name",
                              iconData: Icons.person,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15.0),
                            child: CustomTextField(
                              keyboaredTybe: TextInputType.emailAddress,
                              controller: emailController,
                              label: "Email",
                              iconData: Icons.email,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15.0),
                            child: CustomTextField(
                              keyboaredTybe: TextInputType.phone,
                              controller: phoneController,
                              label: "Phone",
                              iconData: Icons.phone,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15.0),
                            child: CustomTextField(
                              keyboaredTybe: TextInputType.text,
                              controller: passwordController,
                              label: "Password",
                              iconData: Icons.lock,
                            ),
                          ),
                        ],
                      ),
                      // SignUp Button:
                      CustomAuthButton(
                          label: "Sign Up",
                        onTap: (){},
                      ),
                      // Social Buttons:
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          customSocialButton(imgUrl: "assets/icons/apple.png"),
                          SizedBox(
                            width: 20,
                          ),
                          customSocialButton(
                            imgUrl: "assets/icons/facebook.png",
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          customSocialButton(
                            imgUrl: "assets/icons/google.png",
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "If you have an account?",
                            style: TextStyle(

                              color: Colors.white
                            ),
                          ),
                          TextButton(
                              onPressed: (){},
                              child: Text(
                                "Sign In here",
                                style: TextStyle(
                                  color: const Color(0xFF0ACF83),
                                ),
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget customSocialButton({
  required String imgUrl,
}) {
  return Container(
    height: 55,
    width: 55,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: Image(
      image: AssetImage(imgUrl),
    ),
  );
}
