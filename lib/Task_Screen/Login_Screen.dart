import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utilits/colors & textstyle.dart';
import 'Home_Screen.dart';

class Login_Screen extends StatefulWidget {
  const Login_Screen({super.key});

  @override
  State<Login_Screen> createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {
  bool obscure = true;

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Center(
          child:
          _mainBody(),
        ),
      ),
    );
  }
  //MAIN BODY
  Widget _mainBody(){
    return Padding(
      padding: EdgeInsets.only(left: 20,right: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _login(),
          _UserName(),
          _Password(),
          SizedBox(height: 20),
          _Button()
        ],
      ),
    );
  }

  //LOGIN
  Widget _login() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
          alignment: Alignment.topLeft,
          child: Text(
            "Login",
            style: LoginT,
          )),
    );
  }

  //USER NAME
  Widget _UserName() {
    return TextFormField(
      controller: _usernameController,
      textCapitalization: TextCapitalization.none,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please enter user name";
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        hintText: "Username",
        hintStyle: userHT,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: grey1),
          borderRadius: BorderRadius.circular(8),
        ),
        prefixIcon: Icon(
          Icons.person,
          color: grey2,
        ),
        fillColor: Colors.white,
        filled: true,
      ),
      textInputAction: TextInputAction.next,
      style: Textfield_Style,
      keyboardType: TextInputType.text,
    );
  }

  //PASSWORD
  Widget _Password() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 50),
      child: TextFormField(
        controller: _passwordController,
        obscureText: obscure,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Please enter password";
          } else {
            return null;
          }
        },
        decoration: InputDecoration(
          contentPadding:
          EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          hintText: "Password",
          hintStyle: userHT,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: grey1),
              borderRadius: BorderRadius.circular(8)),
          prefixIcon: Icon(
            Icons.lock,
            color: grey2,
          ),
          suffixIcon: IconButton(
            icon: Icon(
              obscure
                  ? Icons.remove_red_eye_outlined
                  : Icons.remove_red_eye_sharp,
              color: grey2,
            ),
            onPressed: () {
              setState(() {
                obscure = !obscure;
              });
            },
          ),
          fillColor: Colors.white,
          filled: true,
        ),
        textInputAction: TextInputAction.next,
        style: Textfield_Style,
      ),
    );
  }

  //BUTTON
  Widget _Button() {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: black1,
          minimumSize: Size(double.infinity, 50),
          elevation: 9,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            if (_usernameController.text == "admin" &&
                _passwordController.text == "admin@123") {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Invalid credentials')),
              );
            }
          }
        },
        child: Text(
          "Login",
          style: ButtonT,
        ),
      ),
    );
  }
}

