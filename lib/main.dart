// import 'package:designing/logo.dart';

// import 'package:designing/providerr.dart';

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// void main() => runApp(const MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (context) => SearchProvider(context)),
//         ChangeNotifierProvider(create: (context) => FavourateModel()),
//       ],
//       child: const MaterialApp(
//         title: 'Flutter Demo',
//         home: Logo(),
//         debugShowCheckedModeBanner: false,
//       ),
//     );
//   }
// }
import 'package:designing/keyboard.dart';
import 'package:designing/laptop.dart';
import 'package:designing/logo.dart';
import 'package:designing/phone.dart';
import 'package:designing/providerr.dart';
import 'package:designing/tablet.dart';
import 'package:designing/watch.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SearchProvider(context),
        ),
        ChangeNotifierProvider(
          create: (context) => KeyboardProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PhoneProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => TabbProvider(),
        ),
        ChangeNotifierProvider(create: (context) => FavourateModel()),
        ChangeNotifierProvider(create: (context) => LaptopProvider()),
        ChangeNotifierProvider(create: (context) => WatchProvider()),
      ],
      child: const MaterialApp(
        title: 'Flutter Demo',
        home: Logo(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
