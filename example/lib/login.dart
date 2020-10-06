import 'package:flourish_flutter_sdk/flourish.dart';
import 'package:flourish_flutter_sdk_example/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  State createState() => new _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            TextField(
              decoration: InputDecoration(hintText: "Username"),
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(hintText: "password"),
            ),
            RaisedButton(
              elevation: 5.0,
              onPressed: () {
                /// Sometime later when the user perform the login
                Provider.of<Flourish>(
                  context,
                  listen: false,
                )
                    .authenticate(
                  userId: 'u123',
                  sessionId: 'b4f6345ab3', // TODO: Review if we gonna use it!!
                )
                    .then((value) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Home(),
                    ),
                  );
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
