import 'package:flutter/material.dart';
import 'jr_home/jr_homePage.dart';

void main() => runApp(_widgetForRoute('myApp'));

 Widget _widgetForRoute(String route){

   switch (route){

     case 'myApp':return new JRHaojieApp();
     case 'home':return new JRHaojieApp();
     default : return new MaterialApp(

       title: 'Flutter Demo',
       theme: ThemeData(

         primarySwatch: Colors.blue,
       ),
       home: new Center(
         child: Text('哈哈哈'),
       ),
     );
   };

 }
class JRHaojieApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.red,
      ),
      home: HomePage(title: '首页'),
    );
  }
}

