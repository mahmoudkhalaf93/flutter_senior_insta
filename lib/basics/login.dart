import 'package:flutter/material.dart';
import 'package:flutter_senior/basics/forget_password.dart';
import 'package:flutter_senior/basics/sign_up.dart';


class Login extends StatelessWidget {
 var emailcontroller= TextEditingController();
 var passwordcontroller= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(



      body:  SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Codeplayon',
                    style: TextStyle(
                      fontSize: 50.0,
                      fontWeight: FontWeight.w900,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                   controller: emailcontroller,
                    onFieldSubmitted: (String value){
                      print(value);
                    },
                    onChanged: (String value)
                    {
                      print(value);
                    },
                    decoration: InputDecoration(
                      labelText: 'Email address',
                      prefixIcon: Icon(
                        Icons.email,
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    controller: passwordcontroller,
                    obscureText: true,
                    onFieldSubmitted: (String value){
                      print(value);
                    },
                    onChanged: (String value)
                    {
                      print(value);
                    },
                    decoration: InputDecoration(
                      labelText: 'password',
                      prefixIcon: Icon(
                        Icons.lock,

                      ),
                      suffixIcon: Icon(
                          Icons.remove_red_eye
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ForgetPassword(),));
                    },
                    child: Text(
                      'Forgot Password',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(

                    width: double.infinity,
                    color: Colors.blue,
                    child: MaterialButton(onPressed:(){
                      print(emailcontroller.text);
                      print(passwordcontroller.text);
                    },
                      child:Text(
                        'login',
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ) ,
                    ),
                  ),
                  SizedBox(height: 10.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\`t have an account?',
                      ),
                      SizedBox(width: 10.0,),
                      InkWell(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SignUp(),));
                        },
                        child: Text(
                          'Sign in',
                        ),
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

  }}