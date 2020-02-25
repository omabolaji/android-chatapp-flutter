import 'package:flutter/material.dart';
import 'material_log_btn.dart';
import 'input_text_field.dart';
import 'chat_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'registration';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  bool _showSpinner = false;
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: _showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    height: 200.0,
                    child: Icon(
                      Icons.flash_on,
                      size: 100,
                      color: Colors.yellow,
                    ),
                  ),
                ),
              ),
              TextInputField(
                textNature: false,
                keypadType: TextInputType.emailAddress,
                hint: 'Enter Username/Email',
                onChanged: (value) {
                  email = value;
                },
              ),
              SizedBox(
                height: 15.0,
              ),
              TextInputField(
                textNature: true,
                hint: 'Enter Password',
                onChanged: (value) {
                  password = value;
                },
              ),
              MaterialLogBtn(
                colour: Colors.blue,
                onpressed: () async {
                  setState(() {
                    if (!email.contains("@") || password.length < 5) {
                      _showSpinner = false;
                    } else {
                      _showSpinner = true;
                    }
                  });
                  //print(email);
                  //print(password);
                  try {
                    final newUser = await _auth.createUserWithEmailAndPassword(
                        email: email, password: password);
                    if (newUser != null) {
                      Navigator.pushNamed(context, ChatScreen.id);
                    }

                    setState(() {
                      _showSpinner = false;
                    });
                  } catch (e) {
                    print(e);
                  }
                },
                labelText: Text(
                  'Register',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
