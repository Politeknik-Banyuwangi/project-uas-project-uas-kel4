import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xffFFFFFF),
        appBar :AppBar(
          title: Text("Profile"),
          backgroundColor: Color(0xffFFFFFF),
          elevation: 0,
          actions: <Widget>[
            Padding(padding: const EdgeInsets.only(right: 18.0), child: Icon(Icons.verified_user, color: Colors.red)),
          ],
      ),
      //user
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage('https://i.pinimg.com/originals/0f/bb/ac/0fbbac26dcbd2670d1f9442949edb45e.jpg'),
                  ),
                ),
         Padding(
           padding: const EdgeInsets.only(left: 30.0),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: <Widget>[
               Text("Shella Ananta", style: TextStyle(fontsize: 20, color: Colors.black)),
               Padding(
                 padding: const EdgeInsets.only(top: 10.0),
                 child: Row(
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children: <Widget>[
                     Icon(
                       Icons.location_on,
                       color; Colors.white70,
                       size: 15,
                     ),
                     Padding(
                                  padding: const EdgeInsets.only(left: 4.0),
                                  child: Text(
                                    'Banyuwangi, Jawa Timur ',
                                    style: TextStyle(color: Colors.black, fontSize: 12, letterSpacing: 3, wordSpacing: 2),
                                  )),
                            ],
                          ),
                        ),
                      ],
                    )),
              ],
            ),