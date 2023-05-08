import 'package:flutter/material.dart';
import '../utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();
  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 2));
      Navigator.pushNamed(context, MyRoutes.homeRoute);
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.canvasColor,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image.asset(
                "assets/images/login_image.png",
                fit: BoxFit.cover,
                // height: 200,
              ),
              SizedBox(
                height: 10.0,
                // child: Text("Head"),
              ),
              Text(
                "Welcome $name",
                style: TextStyle(
                    fontSize: 17,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold),
                textScaleFactor: 2.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 32.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: "Enter Username", labelText: "Username"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Username cannot be Empty";
                        }
                        return null;
                      },
                      onChanged: (value) => {
                        setState(() {
                          name = value;
                        }),
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: "Enter Password", labelText: "Password"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Password cannot be Empty";
                        } else if (value.length < 6) {
                          return "Password should be atleast 6";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 30.0,
                      // child: Text("Head"),
                    ),
                    Material(
                      color: context.theme.buttonColor,
                      borderRadius:
                          BorderRadius.circular(changeButton ? 50 : 8),
                      child: InkWell(
                          onTap: () => moveToHome(context),
                          child: AnimatedContainer(
                            duration: Duration(seconds: 2),
                            height: 50,
                            width: changeButton ? 100 : 200,
                            alignment: Alignment.center,
                            child: changeButton
                                ? Icon(
                                    Icons.done,
                                    color: Colors.white,
                                  )
                                : Text(
                                    "Login",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                            // decoration: BoxDecoration(
                            //   color: Colors.deepPurple,
                            //   // borderRadius: BorderRadius.circular(8)
                            //   shape: changeButton
                            //       ? BoxShape.circle
                            //       : BoxShape.rectangle,
                            // ),
                          )),
                    ),
                    // ElevatedButton(
                    //     child: Text(
                    //       "Login",
                    //       style: TextStyle(fontSize: 20),
                    //     ),
                    //     style: TextButton.styleFrom(minimumSize: Size(200, 50)),
                    //     onPressed: () {
                    //       Navigator.pushNamed(context, MyRoutes.homeRoute);
                    //     })
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
