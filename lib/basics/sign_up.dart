import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var emailcontroller= TextEditingController();
  var passwordcontroller= TextEditingController();
  var confirmpasswordcontroller= TextEditingController();
  var formkey= GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SignUp'),
      ),
      body: Form(
        key: formkey,
        child: Container(
          margin: EdgeInsets.all(10.0),
          child: Column(
            children: [
              TextFormField(
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
                  border: OutlineInputBorder(),
                  labelText: 'email',
                  prefixIcon: Icon(Icons.email,),
                ),
                controller: emailcontroller,
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 10.0,),
              TextFormField(
                validator:(value){
                  if(value!.isEmpty){
                    return "password required";
                  }
                  return null;
                } ,
                controller: passwordcontroller,
                obscureText: true,

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
              SizedBox(height: 10.0,),
              TextFormField(
                validator: (value){
                  if(value!.isEmpty){
                    return "password required";
                  }

                  return null;
                },
                controller: confirmpasswordcontroller,
                obscureText: true,

                decoration: InputDecoration(
                  labelText: 'Confirm password',
                  prefixIcon: Icon(
                    Icons.lock,

                  ),
                  suffixIcon: Icon(
                      Icons.remove_red_eye
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10.0,),
              MaterialButton(onPressed: (){
                if (formkey.currentState!.validate()){
                  print('validate');
                }
              },
                color: Colors.blue,
                child: Text('confirm'),
                textColor: Colors.white,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
