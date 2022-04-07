import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_senior/resturant/register_screen.dart';
import 'package:flutter_senior/resturant/admin_screen.dart';

class RestaurantScreen extends StatefulWidget {


  @override
  State<RestaurantScreen> createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  var emailcontroller= TextEditingController();
  var passwordcontroller= TextEditingController();
  var confirmpasswordcontroller= TextEditingController();
  var formkey= GlobalKey<FormState>();
  bool _isVisible = false;
  bool _isRight = false;
  void updateStatus() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }
  void ueStatus() {
    setState(() {
      _isRight = !_isRight;
    });
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Form(
          key: formkey,
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,

                    child: Image(image: AssetImage('images/WW.jpg'),
                    ),
                  ),
                  SizedBox(height: 10.0,),
                  Text(
                    'LOGIN',
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.w900,
                      color: Colors.amber,
                    ),
                  ),
                  SizedBox(height: 10.0,),
                  //email
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value){
                        if(value!.isEmpty){
                          return "Email required";
                        }
                        if(!value.contains("@")|| !value.contains(".")){
                          return "enter valid email";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                        labelText: 'email',
                        prefixIcon: Icon(Icons.email,),
                      ),
                      controller: emailcontroller,
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  SizedBox(height: 10.0,),
                  //pasword
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator:(value){
                        if(value!.isEmpty){
                          return "password required";
                        }
                        return null;
                      } ,
                      controller: passwordcontroller,
                      obscureText: _isRight? false : true,

                      decoration: InputDecoration(
                        labelText: 'password',
                        prefixIcon: Icon(
                          Icons.lock,

                        ),
                        suffixIcon: IconButton(onPressed: (){
                            return ueStatus();
                        },
                          icon: Icon(
                              _isRight? Icons.remove_red_eye: Icons.visibility_off
                        ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0,),
                  // login
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MaterialButton(onPressed: (){
                        if (formkey.currentState!.validate()){
                          print('validate');

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ReservationScreen()
                          ),
                        );}
                      },
                        color: Colors.amber,
                        child: Text('Login',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30.0,
                        ),
                        ),
                        textColor: Colors.white,
                      ),
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
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>RegisterScreen(),));
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
    );
  }
}
