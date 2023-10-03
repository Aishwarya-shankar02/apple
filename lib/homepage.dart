
// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';


import 'package:designing/headphone.dart';
import 'package:designing/keyboard.dart';
import 'package:designing/laptop.dart';
import 'package:designing/phone.dart';
import 'package:designing/tablet.dart';
import 'package:designing/watch.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String displayName = '';

  @override
  void initState() {
    super.initState();
   
  }


  void watch(context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) =>const Watch()));
  }

  void phone(context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) =>const Phone()));
  }

  void television(context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) =>const Keyboard()));
  }

  void laptop(context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) =>const Laptop()));
  }

  void tab(context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) =>const Tabb()));
  }

  void headphone(context) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (BuildContext context) => HeadPhone()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        elevation: 0,
        title:         const    Text("Welcome",style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),
      ),
      body: Container(
        width: double.infinity,
        height: double
            .infinity, // Use double.infinity to take up the entire screen height
        decoration: const BoxDecoration(color: Colors.orangeAccent),
        child: GridView(
          gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of columns
            crossAxisSpacing: 18.0, // Spacing between columns
            mainAxisSpacing: 50.0, // Spacing between rows
          ),
          padding:const EdgeInsets.all(20.0), // Add padding to the grid
          children: [

            CustomHomege(
              text: "Phone",
              symbol: Icons.smartphone,
              onTap: phone,
            ),
            CustomHomege(
              text: "Watch",
              symbol: Icons.watch,
              onTap: watch,
            ),
            CustomHomege(
              text: "Tablet",
              symbol: Icons.tablet,
              onTap: tab,
            ),
            CustomHomege(
              text: "Laptop",
              symbol: Icons.computer,
              onTap: laptop,
            ),
            CustomHomege(
              text: "EarPhone",
              symbol: Icons.headphones,
              onTap: headphone,
            ),
            CustomHomege(
              text: "TV",
              symbol: Icons.tv,
              onTap: television,
            ),
          ],
        ),
      ),
    );
  }
}

class CustomHomege extends StatelessWidget {
  final String text;
  final IconData symbol;
  final void Function(BuildContext) onTap;

    CustomHomege({super.key, 
    required this.text,
    required this.symbol,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              text,
              style: const TextStyle(fontSize: 20, color: Colors.deepOrange),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Icon(
                symbol,
                size: 40,
                color: Colors.deepOrange,
              ),
            )
          ],
        ),
      ),
    );
  }
}
