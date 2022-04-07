import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:intl_phone_field/intl_phone_field.dart';


class LoginTask extends StatelessWidget {

  var emailcontroller= TextEditingController();
  var passwordcontroller= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(70.0),
          child: AppBar(
            centerTitle: true,
                      leading: Icon(Icons.keyboard_arrow_left),
            title: Text(
              'Login',
              style: TextStyle(
                fontSize: 30.0,

              ),

            ),
                 flexibleSpace: Image(
                        image: AssetImage('images/a.jpg'),
                                         fit: BoxFit.cover,
                                                           ),
     shape: RoundedRectangleBorder(
       borderRadius: BorderRadius.only(

           bottomRight: Radius.circular(50.0),
           bottomLeft: Radius.circular(50.0),

       ),
     ),
    ),
        ),


      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome to Fashion daily',
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Register',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 50.0,
                      ),
                    ),
                    SizedBox(
                      width: 55.0,
                    ),
                    TextButton(onPressed: (){},
                      child:
                      Text(
                        'Help',
                      ),
                    ),
                    TextButton(onPressed: (){},
                      child:
                      Icon(
                        Icons.help,
                      ),
                    ),
                  ],
                ),
              ),


              SizedBox(
                height: 20.0,),
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
                  hintText: 'Example@email.com',
                  labelText: 'Email address',
                  prefixIcon: Icon(
                    Icons.email,
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 20.0,),
              IntlPhoneField(
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                ),
                initialCountryCode: 'IN',
                onChanged: (phone) {
                  print(phone.completeNumber);
                },
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
                  hintText: 'password',
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
                  height: 20.0),
              Container(
                width: double.infinity,
                color: Colors.blue,
                child: MaterialButton(onPressed: (){},
                child:Text(
                  'Register',
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.white,
                  ),

                ),

                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'OR'
              ),
              Container(
                width: double.infinity,

                child: SignInButton(
                  Buttons.Google,
                  text: "Sign up with Google",
                  onPressed: () {},
                ),
              ),

            ],
          ),
        ),
      ),




    );
  }
}
