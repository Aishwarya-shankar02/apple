import 'package:flutter/material.dart';
import 'package:designing/bottomnavi.dart';
import 'package:designing/register.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool securetext = true;
  void saveNameAndEmail() async {
    String name = emailController.text;
    String password = passwordController.text;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', name);
    await prefs.setString('password', password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(builder: (context, orientation) {
        return SingleChildScrollView(
          child: Column(children: [
            Container(
              width: double.infinity,
              height: 330,
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
                    SizedBox(
                      child: Center(
                        child: Text(
                          "Login",
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: SizedBox(
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
                              controller: emailController,
                              decoration: const InputDecoration(
                                focusColor: Colors.amber,
                                border: InputBorder.none,
                                icon: Icon(Icons.email),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                hintText: "Email",
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: SizedBox(
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
                              obscureText: securetext,
                              controller: passwordController,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  icon: const Icon(Icons.key),
                                  hintText: "Password",
                                  suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          securetext = !securetext;
                                        });
                                      },
                                      icon: Icon(securetext
                                          ? Icons.security
                                          : Icons.remove_red_eye))),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 170),
                  child: TextButton(
                    onPressed: () {
                      // Implement password recovery logic here
                    },
                    child: const Text(
                      "Forgot Password?",
                      style: TextStyle(color: Colors.black38),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
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
                onPressed: () {
                  saveNameAndEmail();
                  final email = emailController.text;
                  final password = passwordController.text;
                  if (email.isNotEmpty && password.isNotEmpty) {
                    // Navigate to the bottom navigation page
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (BuildContext context) => const Bottomnavi(),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Login Failed. Please try again.'),
                      ),
                    );
                  }
                },
                child: const Text("LOGIN"),
              ),
            ),
            const SizedBox(
              height: 160,
            ),
            SizedBox(
              child: Padding(
                padding: const EdgeInsets.only(left: 120),
                child: Row(
                  children: [
                    const Text(
                      "Don't have an account?",
                      style: TextStyle(color: Colors.black38),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (BuildContext context) => const Register(),
                          ),
                        );
                      },
                      child: const Text(
                        "Register",
                        style: TextStyle(color: Colors.deepOrangeAccent),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ]),
        );
      }),
    );
  }
}
