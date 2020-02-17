/*
Open Emulator: flutter emulators --launch Pixel_2_API_29
*/
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/tabs_screen.dart';
import 'providers/major_provider.dart';
import 'screens/major_detail_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => MajorProvider(),
      child: MaterialApp(
        title: 'College App',
        theme: ThemeData(
            primarySwatch: Colors.pink,
            accentColor: Colors.amber,
            canvasColor: Color.fromRGBO(255, 254, 229, 1),
            textTheme: ThemeData.light().textTheme.copyWith(
                body1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
                body2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
                title: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
        //home: MyHomePage(title: 'Flutter Demo Home Page'),
        //home: TabsScreen(),
        routes: {
          '/': (ctx) => TabsScreen(),
          //MajorDetailScreen.routeName: (ctx) => MajorDetailScreen(),
        },
      ),
    );
  }
}
