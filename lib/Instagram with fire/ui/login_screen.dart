


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_senior/Instagram%20with%20fire/buisness_logic/login/login_cubit.dart';

import 'package:flutter_senior/Instagram%20with%20fire/ui/homee_screen.dart';
import 'package:flutter_senior/Instagram%20with%20fire/ui/register_screen.dart';
import 'package:flutter_senior/components.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();

  var passwordController = TextEditingController();
  bool isPasswordVisable = false;

  var formKey = GlobalKey<FormState>();

  late LoginCubit cubit;

  @override
  Widget build(BuildContext context) {
    //cubit = BlocProvider.of<LoginCubit>(context);

    cubit= context.read<LoginCubit>();

    return BlocListener<LoginCubit, LoginStates>(
  listener: (context, state) {
    // TODO: implement listener
    if (state is LoginSuccessStates){
      //Navigate Home
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomeeScreen(),
          ));
    }
    else if(state is LoginFailureStates){
      print(state.errorMessage);


      SnackBar snackbar = SnackBar(
        content: Text(state.errorMessage),
      action:SnackBarAction(
          label: "ok",
          onPressed: (){}
          ) ,
      );
      
      ScaffoldMessenger.of(context).showSnackBar(snackbar);

    }
  },
  child: Scaffold(
      body: Form(
        key: formKey,
        child: Container(
          alignment: Alignment.center,
          padding:  EdgeInsets.symmetric(horizontal: 20.sp),
          //margin: EdgeInsets.only(bottom: 60),
          child: ListView(
            shrinkWrap: true,
            // crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.center
            children: [
              Text(
                "LOGIN",
                style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15.sp,
              ),
              Text(
                "Login now to browse our hot 🔥 offers",
                style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[500]),
              ),
              SizedBox(
                height: 25.sp,
              ),
              myshopTextFormField(
                  label: "ُEmail Address",
                  validator: (value)=> cubit.emailValidator(value.toString()) ,
                  controller: emailController,
                  prefixIcon: Icons.email,
                  keyboardType: TextInputType.emailAddress),
              SizedBox(
                height: 16.sp,
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
                height: 26.sp,
              ),
              ButtonWidget(
                texts: "LOGIN",
                onPressed: () {
                  if(formKey.currentState!.validate()){
                  cubit.login(
                      email: emailController.text,
                      password: passwordController.text
                  );
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>HomeeScreen(),));
                  }
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account ? "  ,style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                  ),),TextButton(onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen(),));
                  }, child:  Text("REGISTER"  ,style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue
                  ),))],)
            ],
          ),
        ),
      ),
    ),
);
  }

  Widget myIconWidget() {return InkWell(
      onTap: () {
        isPasswordVisable = !isPasswordVisable;
        setState(() {});
      },
      child: !isPasswordVisable
          ?  Icon(Icons.visibility_off, size: 22.sp,)
          :  Icon(Icons.visibility, size: 22.sp,));}

  emailValidator(String value) {
    if (value.isEmpty) {
      return "please Enter Email";
    }
    bool emailValid = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(value);
    if (!emailValid) {
      return "email not valid";
    }
    return null;
  }
}