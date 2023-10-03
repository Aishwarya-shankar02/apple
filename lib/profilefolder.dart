import 'package:designing/displayselectedcards.dart';
import 'package:flutter/material.dart';

class Profilefolder extends StatefulWidget {
  const Profilefolder({Key? key}) : super(key: key);

  @override
  State<Profilefolder> createState() => _ProfilefolderState();
}

class _ProfilefolderState extends State<Profilefolder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: Text("Profile"),
      ),
      body: Column(
        children: [
          
          Container(
            width: 200,
            height: 200,
            decoration: ShapeDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/c6cb4971bfb12fe21adbe9fe32d8f345.jpg"),
                fit: BoxFit.fill,
              ),
              shape: OvalBorder(),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const FavoritesPage()));
            },
            child: const Card(
              elevation: 2,
              child: ListTile(
                leading: Icon(Icons.favorite),
                title: Text("favourite"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
