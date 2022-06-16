import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.login),
            label: ('Login'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: ('Dasboard'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: ('Profil'),
          ),
        ],
      ),
    );
  }
}

class Bills extends StatefulWidget {
  @override
  _Bills createState() => _Bills();
}

class _Bills extends State<Bills> {
  int _selectedNavbar = 0;
  var _pages = <Widget>[
    Icon(Icons.book, size: 30, color: Colors.black),
    Icon(Icons.book, size: 30, color: Colors.black),
    Icon(Icons.book, size: 30, color: Colors.black),
    Icon(Icons.book, size: 30, color: Colors.black),
    Icon(Icons.book, size: 30, color: Colors.black),
    Icon(Icons.book, size: 30, color: Colors.black),
  ];
  var _titleBills = [
    'BIOLOGI',
    'KIMIA',
    'FISIKA',
    'MATEMATIKA',
    'BAHASA INGGRIS',
    'BAHASA INDONESIA',
  ];
  var _subtitleGuru = [
    'Adi Setya Purwanto',
    'Nur Shinta Ramadanti',
    'Eko Saputra',
    'Vinzen Qiy',
    'Cintra Puspita',
    'Azizah Saputri',
  ];
  void _changeSelectedNavBar(int index) {
    setState(() {
      _selectedNavbar = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Mata Pelajaran',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Container(
            height: 300,
            child: ListView.builder(
              itemCount: 6,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  child: Card(
                    child: ListTile(
                      title: Text(
                        '${_titleBills[index]}',
                        style: TextStyle(color: Colors.black, fontSize: 16.0),
                        overflow: TextOverflow.ellipsis,
                      ),
                      subtitle: Text(
                        '${_subtitleGuru[index]}',
                        overflow: TextOverflow.ellipsis,
                      ),
                      leading: Container(
                        padding: EdgeInsets.all(5),
                        child: _pages[index],
                      ),
                    ),
                  ),
                );
              },
            ),
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
