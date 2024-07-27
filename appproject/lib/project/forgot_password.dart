import 'package:flutter/material.dart';

import 'login.dart';

void main(){
  runApp(MaterialApp(
    home: ForgotPassword(),
    debugShowCheckedModeBanner: false,
  ));
}
class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {

  final TextEditingController emailController=TextEditingController();
  final GlobalKey<FormState> _formKey=GlobalKey<FormState>();
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
              top: 100,
              right: 100,
              left: 100,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white30,
                  boxShadow: [BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6.2,
                    spreadRadius: 2.0,
                  ),
                  ],
                  border: Border.all(color: Colors.white70),
                ),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Form(
                    key: _formKey,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Forgot Password",
                              style: TextStyling().blckText,
                            ),
                          ),
                          SizedBox(height: 40),
                          Text(
                            "Email Address",
                            style: TextStyling().greyText,
                          ),
                          TextFormField(
                            controller: emailController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                )
                            ),
                            validator: (value) {
                              if(value==null||value.isEmpty){
                                return "enter your email id";
                              }
                              else if(value.contains('@')==false){
                                return "enter valid email id";
                              }
                            },
                          ),
                          SizedBox(height: 30),
                          Align(
                            alignment: Alignment.center,
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {

                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (context) => Login(),
                                    ),
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(width: 80),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(30.0),
                                  ),
                                ),
                              ),
                              child: Text("Process",style: TextStyle(color: Colors.white, fontSize: 18
                              ),),
                            ),
                          )
                        ]
                    ),
                  )

          )
          ),
    )
        ],

      ),
    );
  }
}
class TextStyling {
  final TextStyle blckText = TextStyle(color: Colors.black, fontSize: 32, fontWeight: FontWeight.w500);
  final TextStyle greyText = TextStyle(color: Colors.grey[800], fontSize: 18);
}