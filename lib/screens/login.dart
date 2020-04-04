import 'package:covidpass/screens/signup.dart';
import 'package:covidpass/utils/colors.dart';
import 'package:covidpass/utils/keyboard_utils.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TapGestureRecognizer _registerRecognizer = TapGestureRecognizer();
  TextEditingController _mobileController = TextEditingController();

  @override
  void initState() {
    _registerRecognizer.onTap = () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => SignUp(),
          ),
        );
    super.initState();
  }

  @override
  void dispose() {
    _mobileController.dispose();
    _registerRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => KeyboardUtils.hideKeyboard(context),
      child: Scaffold(
        backgroundColor: PrimaryDarkColor,
        body: Column(
          children: <Widget>[
            Flexible(
              child: Container(
                child: ListView(
                  children: <Widget>[
                    Image.asset(
                      "assets/ic_login.png",
                      height: 360,
                    ),
                    Text(
                      "Sign in to continue",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              flex: 4,
            ),
            Flexible(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: ListView(
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Phone Number"),
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: PrimaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                      ),
                      child: FlatButton(
                          child: Text(
                            "SIGN IN",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          onPressed: () {}),
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "New User? ",
                            style: TextStyle(
                              color: PrimaryTextColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            recognizer: _registerRecognizer,
                            text: "REGISTER",
                            style: TextStyle(
                              color: PrimaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              flex: 2,
            ),
          ],
        ),
      ),
    );
  }
}
