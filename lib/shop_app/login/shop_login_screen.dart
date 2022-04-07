import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_senior/components.dart';
import 'package:flutter_senior/shop_app/login/cubit/shop_cubit.dart';
import 'package:flutter_senior/shop_app/login/cubit/shop_states.dart';
import 'package:flutter_senior/shop_app/login/shop_register_screen.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

class ShopLoginScreen extends StatelessWidget {
  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    var emailController= TextEditingController();
    var passwordController= TextEditingController();


    return BlocProvider(
      create: (BuildContext context) =>ShopLoginCubit(),
      child: BlocConsumer<ShopLoginCubit, ShopLoginStates>(
        builder: (context, state) {
        return  Scaffold(

          body: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "login now to browse our hot offers",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'email',
                            prefixIcon: Icon(Icons.email_outlined,),

                          ),
                          keyboardType: TextInputType.emailAddress,
                          controller: emailController,
                          validator: (value){
                            if(value!.isEmpty){
                              return "Email required";
                            }
                            if(!value.contains("@")|| !value.contains(".")){
                              return "enter valid email";
                            }
                            return null;

                          },
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        TextFormField(
                          validator:(value){
                            if(value!.isEmpty){
                              return "password required";
                            }
                            return null;
                          } ,
                          controller: passwordController,


                          decoration: InputDecoration(
                            labelText: 'password',
                            prefixIcon: Icon(
                              Icons.lock_outlined,),
                            suffixIcon: IconButton(onPressed: (){},
                              icon: Icon(Icons.visibility_outlined,),),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),

                    ConditionalBuilder(
                      condition: state is! ShopLoginLoadingState ,
                      builder: (context) => defaultButton(
                        function: ()
                        {
                          if(formkey.currentState!.validate())
                          {
                            ShopLoginCubit.get(context).userLogin(
                                email: emailController.text,
                                password: passwordController.text);
                          }
                        },
                        text: "Login",
                        isUpperCase: true,
                        background: Colors.amber,

                      ),
                      fallback: (context) => Center(child: CircularProgressIndicator()),
                    ),

                        SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Don\`t have an account?',
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            InkWell(
                              onTap: (){
                                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ShopRegisterScreen(),));
                              },
                              child: Text(
                                'Register',
                                style: TextStyle(
                                  color: Colors.amber,
                                ),
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
          ),
        );
      },
        listener: (context, state) {

      },
      ),
    );
  }
}
