import 'package:flutter/material.dart';
import 'package:projectuas/homepage.dart';
import 'package:projectuas/loginpage.dart';
import 'package:projectuas/profilepage.dart';

Map<String, WidgetBuilder> buildRoute(BuildContext context){
  return {
    '/': (context) => const HomePage(),
    '/login': (context) => const LoginPage(),
    '/profile': (context) => ProfilePage(),
  };
}