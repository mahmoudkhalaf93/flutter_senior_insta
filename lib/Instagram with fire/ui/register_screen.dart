import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_senior/Instagram%20with%20fire/buisness_logic/register/register_cubit.dart';
import 'package:flutter_senior/Instagram%20with%20fire/buisness_logic/validators.dart';
import 'package:flutter_senior/Instagram%20with%20fire/ui/login_screen.dart';
import 'package:flutter_senior/components.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var userNameController = TextEditingController();

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var phoneController = TextEditingController();

  bool isPasswordVisable = false;

  var formKey = GlobalKey<FormState>();

  late RegisterCubit registerCubit;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    registerCubit = context.read<RegisterCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterStates>(
      listener: (context, state) {
        if (state is RegisterSuccessStates) {
          onRegisterSuccess();
        } else if (state is RegisterFailureStates) {
          onRegisterFailure(state.errorMessage);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.black, //change your color here
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Form(
          key: formKey,
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 22),
            //margin: EdgeInsets.only(bottom: 60),
            child: ListView(
              shrinkWrap: true,
              // crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.center
              children: [
                const Text(
                  "REGISTER",
                  style: const TextStyle(
                      fontSize: 33, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Register now to browse our hot 🔥 offers",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[500]),
                ),
                const SizedBox(
                  height: 18,
                ),
                buildProfileImage(),
                SizedBox(
                  height: 18.sp,
                ),
                myshopTextFormField(
                  label: "User Name",
                  validator: (value) => usernameValidator(value.toString()),
                  controller: userNameController,
                  prefixIcon: Icons.person,
                ),
                const SizedBox(
                  height: 16,
                ),
                myshopTextFormField(
                    label: "ُEmail Address",
                    validator: (value) => emailValidator(value.toString()),
                    controller: emailController,
                    prefixIcon: Icons.email,
                    keyboardType: TextInputType.emailAddress),
                const SizedBox(
                  height: 16,
                ),
                myshopTextFormField(
                    label: "Password",
                    validator: (value) => passwordValidator(value.toString()),
                    controller: passwordController,
                    prefixIcon: Icons.lock,
                    obscureText: isPasswordVisable,
                    suffixIcon: myiconwidg()),
                const SizedBox(
                  height: 16,
                ),
                myshopTextFormField(
                    label: "Phone",
                    validator: (value) => phoneValidator(value.toString()),
                    controller: phoneController,
                    prefixIcon: Icons.phone,
                    keyboardType: TextInputType.phone),
                const SizedBox(
                  height: 32,
                ),
                ButtonWidget(
                  texts: "REGISTER",
                  onPressed: () => register(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void register() {
    if (_xFile == null) {
      onRegisterFailure("Select image!");
      return;
    }
    if (formKey.currentState!.validate()) {
      registerCubit.register(
        username: userNameController.text,
        email: emailController.text,
        password: passwordController.text,
        phone: phoneController.text,
        imageFile: File(_xFile!.path),
      );
    }
  }

  void onRegisterSuccess() {
    Navigator.push(
        context,
      MaterialPageRoute(builder: (context) => const LoginScreen(),
      )
    );
  }

  Widget myiconwidg() {
    return InkWell(
        onTap: () {
          isPasswordVisable = !isPasswordVisable;
          setState(() {});
        },
        child: isPasswordVisable
            ? const Icon(Icons.visibility_off)
            : const Icon(Icons.visibility));
  }

  void onRegisterFailure(String errorMessage) {
    SnackBar snackBar = SnackBar(
      content: Text(errorMessage),
      action: SnackBarAction(
        label: 'Ok',
        onPressed: () {},
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  XFile? _xFile;

  Widget buildProfileImage(){
      return InkWell(
        onTap: () async {
          final ImagePicker _picker = ImagePicker();
          // Pick an image
          _xFile = await _picker.pickImage(source: ImageSource.gallery);
          setState(() {});
        },
        child: _xFile == null ? CircleAvatar(
          radius: 22.sp,
          child: Icon(Icons.person),
        )
            : Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.sp),
                child: Image.file(
                File(_xFile!.path),
                fit: BoxFit.fill,
                width: 30.sp,
                height: 30.sp,
                )
        ),
            ),
      );
  }
  }
