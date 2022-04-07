import 'package:flutter/material.dart';
import 'package:flutter_senior/resturant/resturant_screen.dart';

class RegisterScreen extends StatefulWidget {


  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var namecontroller= TextEditingController();
  var emailcontroller= TextEditingController();
  var passwordcontroller= TextEditingController();
  var phonecontroller= TextEditingController();
  var confirmpasswordcontroller= TextEditingController();
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
  var formkey= GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: formkey,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Column(
                  children: [
                    Text(
                      'Register',
                      style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20.0,),
                    //name
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        validator: (value){
                          print(namecontroller.text);
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          ),
                          labelText: 'Name',
                          prefixIcon: Icon(Icons.person,),
                        ),
                        controller: namecontroller,
                        keyboardType: TextInputType.name,
                      ),
                    ),
                    SizedBox(height: 20.0,),
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
                    SizedBox(height: 20.0,),
                    //password
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
                    SizedBox(height: 20.0,),
                    //confirm password
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        validator: (value){
                          if(value!.isEmpty){
                            return "password required";
                          }else if(value !=passwordcontroller.text){
                            return "password doesn't match";
                          }

                          return null;
                        },
                        controller: confirmpasswordcontroller,
                        obscureText: _isVisible ? false : true,

                        decoration: InputDecoration(
                          labelText: 'Confirm password',
                          prefixIcon: Icon(
                            Icons.lock,

                          ),
                          suffixIcon: IconButton(onPressed: (){
                            return updateStatus();
                          },
                            icon: Icon(
                                _isVisible? Icons.remove_red_eye: Icons.visibility_off
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0,),
                    //PhoneNumber
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        validator: (value){
                          print('phone tapped');
                        },
                        controller: phonecontroller,
                        keyboardType: TextInputType.name,


                        decoration: InputDecoration(

                          labelText: 'Phone Number',
                          prefixIcon: Icon(
                            Icons.phone,

                          ),

                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0,),
                    Container(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: MaterialButton(onPressed: (){
                          if (formkey.currentState!.validate()){
                            print('Register');

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RestaurantScreen()
                              ),
                            );}
                        },
                          color: Colors.amber,
                          child: Text('Register',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30.0,
                            ),
                          ),
                          textColor: Colors.white,
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
