import 'package:flutter/material.dart';
import 'package:flutter_crud/screens/welcome_user.dart';
import 'package:http/http.dart' as http;

class ApiTesting extends StatefulWidget {
  const ApiTesting({Key? key}) : super(key: key);

  @override
  State<ApiTesting> createState() => _ApiTestingState();
}

class _ApiTestingState extends State<ApiTesting> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  Future<void> login() async {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      var response = await http.post(
          Uri.parse('https://reqres.in/api/register'),
          body: ({
            'email': emailController.text,
            'password': passwordController.text
          }));
      if (response.statusCode == 200) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => WelcomePage()));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Please Enter Valid Credentials")));
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Please Enter Credentials")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                    labelText: 'email',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
                validator: (val) {
                  if (val!.isEmpty) {
                    return "Please Enter Email";
                  } else if (!val.contains('@')) {
                    return "Please enter Valid Email";
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
                obscureText: true,
                validator: (val) {
                  if (val!.isEmpty) {
                    return "Please Enter Password";
                  } else if (val.length < 6) {
                    return "at Least 6 characters required";
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(height: 50),
              Container(
                width: 300,
                height: 30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue),
                child: ElevatedButton(
                    onPressed: (() {
                      if (formkey.currentState!.validate()) {
                        login();
                      }
                    }),
                    child: Text("Login")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
