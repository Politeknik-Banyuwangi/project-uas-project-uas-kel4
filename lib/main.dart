import "package:flutter/material.dart";

void main() {
  runApp(const MyApp());
}

class Bills extends StatefulWidget {
  @override
  _Bills createState() => _Bills();
}

class _Bills extends State<Bills> {
  int _selectedNavbar = 0;
  var _pages = <Widget>[
    Icon(Icons.work, size: 25, color: Colors.blue),
    Icon(Icons.shopping_cart, size: 25, color: Colors.blue),
    Icon(Icons.wifi, size: 25, color: Colors.blue),
    Icon(Icons.shopping_bag_sharp, size: 25, color: Colors.blue),
    Icon(Icons.shopping_cart, size: 25, color: Colors.blue),
    Icon(Icons.work, size: 25, color: Colors.blue),
    Icon(Icons.shopping_cart, size: 25, color: Colors.blue),
    Icon(Icons.wifi, size: 25, color: Colors.blue),
    Icon(Icons.shopping_bag_sharp, size: 25, color: Colors.blue),
    Icon(Icons.shopping_cart, size: 25, color: Colors.blue),
  ];

  var _titleBills = [
    'Market bills',
    'Supermarket bills',
    'Store bills',
    'Wifi bills',
    'Supermarket bills',
    'Market bills',
    'Supermarket bills',
    'Store bills',
    'Wifi bills',
    'Supermarket bills',
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
                'Upcomming bill',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              Text('See All',
                  style: TextStyle(
                    color: Colors.purple,
                    fontSize: 20.0,
                  )),
            ],
          ),
          // Container(
          //   height: 200,
          //   color: Colors.red,
          // )
          //
          Container(
            height: 500,
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  child: Card(
                    child: ListTile(
                      title: Text(
                        '${_titleBills[index]}',
                        style: TextStyle(color: Colors.black, fontSize: 24.0),
                        overflow: TextOverflow.ellipsis,
                      ),
                      subtitle: Text(
                        'Desember 28, 2021',
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
        currentIndex: _selectedNavbar,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: _changeSelectedNavBar,
      ),
    );
  }
}
