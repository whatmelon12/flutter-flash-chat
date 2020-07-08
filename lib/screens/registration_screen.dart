import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flash_chat/components/input_field.dart';
import 'package:flash_chat/components/round_button.dart';

class RegistrationScreen extends StatefulWidget {
  static const id = 'register_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  bool loading = false;
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: loading,
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
                    child: Image.asset('images/logo.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              InputField(
                hint: 'Enter your email.',
                accentColor: Colors.blueAccent,
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
              ),
              SizedBox(
                height: 8.0,
              ),
              InputField(
                hint: 'Enter your password.',
                accentColor: Colors.blueAccent,
                obscureText: true,
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundButton(
                label: 'Register',
                color: Colors.blueAccent,
                onPressed: () async {
                  setState(() {
                    loading = true;
                  });
                  try {
                    final user = await _auth.createUserWithEmailAndPassword(
                        email: email,
                        password: password
                    );
                    if(user != null) {
                      Navigator.pushNamed(context, ChatScreen.id);
                    }
                  } catch(e) {
                    print(e);
                  } finally {
                    setState(() {
                      loading = false;
                    });
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
