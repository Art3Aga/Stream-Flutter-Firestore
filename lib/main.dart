import 'package:buserosapp/src/vistas/home_page.dart';
import 'package:buserosapp/src/vistas/next_page.dart';
import 'package:flutter/cupertino.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      title: 'Motoristas App',
      home: HomePage(),
      routes: {
        'home' : (context) => HomePage(),
        'next' : (context) => NextPage(),
      },
    );
  }
}