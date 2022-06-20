import "package:flutter/material.dart";
import 'homepage.dart';

class Bills extends StatefulWidget {
  @override
  _Bills createState() => _Bills();
}

class _Bills extends State<Bills> {
  int _selectedNavbar = 0;
  var _pages = <Widget>[
    Icon(Icons.book, size: 25, color: Colors.black),
    Icon(Icons.book, size: 25, color: Colors.black),
    Icon(Icons.book, size: 25, color: Colors.black),
    Icon(Icons.book, size: 25, color: Colors.black),
    Icon(Icons.book, size: 25, color: Colors.black),
    Icon(Icons.book, size: 25, color: Colors.black),
  ];

  var _titleBills = [
    'Administrasi Server',
    'Grafika Komputer',
    'Pemrograman Web',
    'Pengembangan Aplikasi Mobile',
    'Jaringan Komputer Lanjut',
    'Kewirausahaan Teknologi',
  ];
  var _subtitleGuru = [
    'Farisqi',
    'Ruth Emma',
    'Devit',
    'Sepyan',
    'Vivien Wardhany',
    'Indira Nuansa',
  ];

  void _changeSelectedNavBar(int index) {
    setState(() {
      _selectedNavbar = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Mata Pelajaran',
                style: TextStyle(fontSize: 25.0, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          // Container(
          //   height: 200,
          //   color: Colors.red,
          // )
          //
          Container(
              height: 510,
              child: ListView.builder(
                itemCount: 6,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Colors.white,
                      ),
                      child: ListTile(
                        title: Text(
                          '${_titleBills[index]}',
                          style: TextStyle(color: Colors.black, fontSize: 20.0),
                          overflow: TextOverflow.ellipsis,
                        ),
                        subtitle: Text(
                          '${_subtitleGuru[index]}',
                          style: TextStyle(color: Colors.black, fontSize: 15.0),
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
              color: Colors.blue[100]),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.red.shade700,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: ('Profil'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: ('Dasboard'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.login),
            label: ('Log out'),
          ),
        ],
        currentIndex: _selectedNavbar,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: _changeSelectedNavBar,
      ),
    );
  }
}
