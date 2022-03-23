import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Welcome Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome New User"),
            OutlinedButton.icon(
                onPressed: null,
                icon: Icon(
                  Icons.logout,
                  size: 17,
                ),
                label: Text('Logout'))
          ],
        ),
      ),
    );
  }
}
