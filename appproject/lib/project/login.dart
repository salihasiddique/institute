import 'package:appproject/SQLite/sqlite.dart';
import 'package:appproject/project/Registration.dart';
import 'package:appproject/jsonModels/users.dart';
import 'package:appproject/project/viewProfile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'bottomNav.dart';
import 'forgot_password.dart';

void main(){
  runApp(MaterialApp(
    home: Login(),
    debugShowCheckedModeBanner: false,
  ));
}

class Login extends StatefulWidget {
  const Login({super.key});
  @override
  State<Login> createState() => _RegistrationState();
}
class _RegistrationState extends State<Login> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey=GlobalKey<FormState>();
  bool _isPasswordVisible = false;
  bool isLoginTrue=false;

  ValueNotifier<bool> isObscure = ValueNotifier(true);
  final db=DatabaseHelper();

  void login() async {
    bool response = await db.login(usernameController.text as AuthModal, passwordController.text);
    if (response) {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => bottom_nav()));
    } else {
      setState(() {
        isLoginTrue = true;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
        Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.red, Colors.black],
          ),
        ),
      ),
      Positioned(
        bottom: 100,
        top:100,
        right: 100,
        left:100,
        child: Container(
        decoration: BoxDecoration(
          color: Colors.white30,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6.2,
              spreadRadius: 2.0,
            )
          ],
          border: Border.all(color: Colors.white70),
        ),

        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Login",
                  style: TextStyling().blckText,
                ),
              ),
              SizedBox(height: 40),
              Text(
                "Username",
                style: TextStyling().greyText,
              ),
              TextFormField(
                controller: usernameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  )
                ),
                validator: (value) {
                  if(value==null|| value.isEmpty){
                    return "Please enter username";
                  }
                  else if(!RegExp(r'^[A-Z a-z]+$').hasMatch(value)){
                    return "UserName must contain only alphabetic characters";
                  }
                },
              ),
              SizedBox(height: 30),
              Text(
                "Password",
                style: TextStyling().greyText,
              ),
              TextFormField(
                controller: passwordController,
                obscureText: !_isPasswordVisible,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                  ),
                ),
                validator: (value){
                   if (value == null || value.isEmpty) {
                        return "Field must not be empty";
                     } else if (value.length < 7) {
                      return "Password must contain at least 7 characters";
                  }
                   return null;

                },
              ),
              SizedBox(height: 20),
              Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                    onPressed: (){
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>ForgotPassword()));
                    },
                    child:Text("I forgot my password",
                      style: TextStyling().greyText,
                    ),
                  )
              ),
              SizedBox(height: 30),
               Align(
                 alignment: Alignment.center,
                 child:  ElevatedButton(
                   onPressed: () {
                     // String username = usernameController.text;
                     // String password = passwordController.text;
                     if (_formKey.currentState!.validate()) {
                       login();
                       //response from sqlite method

                     }},
                   style: ElevatedButton.styleFrom(
                     backgroundColor: Colors.transparent,
                     shape: RoundedRectangleBorder(
                       side: BorderSide(width: 80),
                       borderRadius: BorderRadius.all(
                         Radius.circular(30.0),
                       ),
                     ),
                   ),
                   child: Text(
                     "login",
                     style: TextStyle(color: Colors.white, fontSize: 18),
                   ),
                 ),
               ),
              SizedBox(height: 20),
              Align(
                  alignment: Alignment.bottomRight,
                  child:
                  Row(
                    children: [
                      Text("Create Account",
                        style: TextStyling().greyText,
                      ),
                      SizedBox(width: 5,),
                      TextButton(
                        onPressed: (){
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Registration()));
                        }, child: Text("Register",style:TextStyle(color: Colors.white),),
                      )
                    ],
                  )
              ),
              isLoginTrue
                  ?const Text("Username or Password is incorrect",
              style: TextStyle(color: Colors.red),
              )
                  :const SizedBox(),

            ],
          ),
        ),
      ),
      ),
      ])
    );
  }
}
class TextStyling {
  final TextStyle blckText = TextStyle(color: Colors.black, fontSize: 32, fontWeight: FontWeight.w500);
  final TextStyle greyText = TextStyle(color: Colors.grey[800], fontSize: 18);
}
