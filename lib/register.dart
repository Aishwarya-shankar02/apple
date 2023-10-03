

import 'package:flutter/material.dart';
import 'package:designing/login.dart';
import 'package:designing/registeration.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  void onPressed(BuildContext context) {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (_) =>const Login()));
  }

  void successful(BuildContext context) {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (_) =>const Registeration()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.4,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(75),
              ),
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.deepOrangeAccent, Colors.orangeAccent],
              ),
            ),
            child: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.apple,
                    color: Colors.white,
                    size: 100,
                  ),
                  Center(
                    child: Text(
                      "Register",
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(20.0),
              shrinkWrap: true,
              children: [
                buildTextField("Fullname", Icons.person),
                buildTextField("Email", Icons.email),
                buildTextField("Phone Number", Icons.phone),
                buildTextField("Password", Icons.key),
                buildTextField("Confirm Password", Icons.key),
                const SizedBox(height: 50),
                buildElevatedButton("Register", () {
                  successful(context);
                }),
                const SizedBox(height: 30),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an account?",
                        style: TextStyle(color: Colors.black38),
                      ),
                      TextButton(
                        onPressed: () {
                          onPressed(context);
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(color: Colors.deepOrangeAccent),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTextField(String hintText, IconData icon) {
    return SizedBox(
      width: 350,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(75),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 18, top: 4),
            child: SizedBox(
              width: 350,
              height: 50,
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  icon: Icon(icon),
                  hintText: hintText,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildElevatedButton(String label, void Function() onPressed) {
    return Container(
      width: 350,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(75),
        gradient: const LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Colors.deepOrangeAccent, Colors.orangeAccent],
        ),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        onPressed: onPressed,
        child: Text(label),
      ),
    );
  }
}
