import 'package:designing/displayselectedcards.dart';
import 'package:designing/homepage.dart';
import 'package:designing/profileuser.dart';
import 'package:designing/search.dart';
import 'package:flutter/material.dart';

class Bottomnavi extends StatefulWidget {
  const Bottomnavi({Key? key}) : super(key: key);

  @override
  State<Bottomnavi> createState() => _BottomnaviState();
}

class _BottomnaviState extends State<Bottomnavi> {
  int selectindex = 0;
  List<Widget> items = [
 const   Homepage(),
    const SearchPhoneList(),
   const FavoritesPage(),
   const Profileuser()
  ];
  void onitemtapped(int index) {
    setState(() {
      selectindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: items[selectindex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          backgroundColor: Colors.black,
          unselectedItemColor: Colors.orange,
          selectedItemColor: Colors.red,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  size: 30,
                ),
                label: "Home",
                backgroundColor: Colors.white),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                  size: 30,
                ),
                label: "search",
                backgroundColor: Colors.white),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border, size: 30),
                label: "Activities",
                backgroundColor: Colors.white),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle, size: 30),
                label: "Profile",
                backgroundColor: Colors.white)
          ],
          currentIndex: selectindex,
          onTap: onitemtapped,
        ));
  }
}
