import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_senior/components.dart';

class SocialLoginScreen extends StatelessWidget {
  const SocialLoginScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'LOGIN',
                    style: Theme.of(context).textTheme.headline4.copyWith(
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'Login now to communicate with friends',
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  defaultFormField(
                    controller: emailController,
                    type: TextInputType.emailAddress,
                    validate: (String value) {
                      if (value.isEmpty) {
                        return 'please enter your email address';
                      }
                    },
                    label: 'Email Address',
                    prefix: Icons.email_outlined,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  myshopTextFormField(
                      label: "Password",
                      validator: (value) => cubit.passwordValidator(value.toString()),
                      controller: passwordController,
                      prefixIcon: Icons.lock,
                      obscureText: isPasswordVisable,
                      suffixIcon: myIconWidget()
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  ConditionalBuilder(
                    condition: state is! SocialLoginLoadingState,
                    builder: (context) => defaultButton(
                      function: () {
                        if (formKey.currentState!.validate()) {
                          SocialLoginCubit.get(context).userLogin(
                            email: emailController.text,
                            password: passwordController.text,
                          );
                        }
                      },
                      text: 'login',
                      isUpperCase: true,
                    ),
                    fallback: (context) =>
                        Center(child: CircularProgressIndicator()),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?',
                      ),
                      defaultTextButton(
                        function: () {
                          navigateTo(
                            context,
                            SocialRegisterScreen(),
                          );
                        },
                        text: 'register',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

}

