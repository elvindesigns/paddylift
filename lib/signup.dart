import 'package:flutter/material.dart';
import 'package:paddylift/landing.dart';
import 'package:paddylift/signin.dart';
import 'package:paddylift/style/color.dart';
import 'package:http/http.dart';
import 'dart:convert';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  double _stateValue = 200;
  double _opacityvalue = 0;
  String _email;
  String _password;
  String _confirmPassword;
  bool _isPasswordVisible = false;
  bool _hasError = false;
  bool _isSigning = false;
  String _errorMessage = "";

  @override
  void initState() {
    super.initState();
    _animate();
  }

  void _animate() {
    Future.delayed(const Duration(milliseconds: 200), () {
      setState(() {
        _stateValue = 0;
        _opacityvalue = 1;
      });
    });
  }

  _signUp() async {
    String url = 'https://paddyliftapp.herokuapp.com/createUser';
    Map<String, String> headers = {"Content-type": "application/json"};
    var signupData = {'userName': _email, 'password': _password};
    String jsonData = jsonEncode(signupData);

    Response response = await post(url, headers: headers, body: jsonData);
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LandingScreen(),
        ),
      );
    }
    if (response.statusCode == 500) {
      setState(() {
        _hasError = true;
        _errorMessage = "Could Not Create User. Try Again";
        _isSigning = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.asset(
            "assets/bg.jpg",
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.6,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView(
              children: <Widget>[
                Center(
                  child: Column(
                    children: <Widget>[
                      AnimatedOpacity(
                        opacity: _opacityvalue,
                        duration: Duration(milliseconds: 250),
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 250),
                          curve: Curves.easeIn,
                          margin: EdgeInsets.only(left: _stateValue),
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 30.0),
                            child: Image.asset("assets/logo.png", width: 150),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(30.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(blurRadius: 20.0, color: Colors.black12)
                            ]),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            _hasError
                                ? Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.cancel,
                                        color: Colors.red,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Text(
                                          _errorMessage,
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  )
                                : Container(),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              "EMAIL ADDRESS",
                              style: TextStyle(color: colorCustomGreen),
                            ),
                            TextField(
                              onChanged: (value) {
                                setState(() {
                                  _email = value;
                                });
                              },
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.alternate_email),
                                hintText: "Enter Email Address",
                              ),
                              keyboardType: TextInputType.emailAddress,
                            ),
                            SizedBox(
                              height: 30.0,
                            ),
                            Text(
                              "PASSWORD",
                              style: TextStyle(color: colorCustomGreen),
                            ),
                            TextField(
                              onChanged: (value) {
                                setState(() {
                                  _password = value;
                                });
                              },
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.more_horiz),
                                hintText: "Enter Password",
                                suffixIcon: InkWell(
                                  onTap: () {
                                    setState(() {
                                      _isPasswordVisible = !_isPasswordVisible;
                                    });
                                  },
                                  child: _isPasswordVisible == false
                                      ? Icon(Icons.visibility)
                                      : Icon(
                                          Icons.visibility_off,
                                          color: colorCustomGreen,
                                        ),
                                ),
                              ),
                              keyboardType: TextInputType.text,
                              obscureText: !_isPasswordVisible,
                            ),
                            SizedBox(
                              height: 30.0,
                            ),
                            Text(
                              "CONFIRM PASSWORD",
                              style: TextStyle(color: colorCustomGreen),
                            ),
                            TextField(
                              onChanged: (value) {
                                setState(() {
                                  _confirmPassword = value;
                                });
                              },
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.more_horiz),
                                hintText: "Confirm Password",
                              ),
                              keyboardType: TextInputType.text,
                              obscureText: !_isPasswordVisible,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.0),
                      RaisedButton(
                        disabledColor: colorCustomGreen,
                        color: colorCustomGreen,
                        onPressed: _isSigning
                            ? null
                            : () {
                                setState(() {
                                  _isSigning = true;
                                });
                                if (_email == null ||
                                    _password == null ||
                                    _confirmPassword == null ||
                                    _email.isEmpty ||
                                    _password.isEmpty ||
                                    _confirmPassword.isEmpty) {
                                  setState(() {
                                    _hasError = true;
                                    _errorMessage =
                                        "All Fields MUST NOT Be Empty";
                                    _isSigning = false;
                                  });
                                  return;
                                }
                                if (_password != _confirmPassword) {
                                  setState(() {
                                    _hasError = true;
                                    _errorMessage = "Passwords DO NOT Match";
                                    _isSigning = false;
                                  });
                                  return;
                                }
                                _signUp();
                                // Navigator.pushReplacement(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => LandingScreen()));
                              },
                        child: Container(
                          width: double.infinity,
                          height: 50,
                          child: Center(
                            child: _isSigning == false
                                ? Text(
                                    "SIGN UP",
                                    style: TextStyle(color: Colors.white),
                                  )
                                : CircularProgressIndicator(
                                    backgroundColor: Colors.white,
                                  ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.0),
                      FlatButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignInScreen(),
                            ),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Already Have An Account? ",
                              style: TextStyle(color: Colors.grey),
                            ),
                            Text("LOG IN",
                                style: TextStyle(
                                    color: colorCustomGreen,
                                    fontWeight: FontWeight.bold))
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
