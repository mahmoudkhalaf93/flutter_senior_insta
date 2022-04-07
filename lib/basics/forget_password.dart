import 'package:flutter/material.dart';

class ForgetPassword extends StatefulWidget {



  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  var emailcontroller= TextEditingController();
  var formkey= GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Forget Password',
        ),
      ),
      body:Form(
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
              MaterialButton(onPressed: (){
                if (formkey.currentState!.validate()){
                  print('validate');
                }
              },
                color: Colors.blue,
                child: Text('send'),
                textColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
