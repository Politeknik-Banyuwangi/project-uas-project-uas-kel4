import "package:flutter/material.dart";

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
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
      ),
      backgroundColor: Colors.blue.shade100,
      body: SafeArea(
          child: Column(
        children: [
          //appbar
          Container(
            color: Colors.red.shade600,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('E-learning',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      )),
                  Container(
                    margin: EdgeInsets.all(20),
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.account_circle, size: 40),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 25),

          Container(
            width: MediaQuery.of(context).size.width - 20,
            margin: EdgeInsets.symmetric(horizontal: 10),
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              color: Colors.white,
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.qr_code_scanner, size: 150),
                  SizedBox(
                    width: 30.0,
                  ),
                  Text(
                    "Absen Disini",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}

class MyCard extends StatelessWidget {
  final double balance;
  final int cardNumber;
  final int month;
  final int year;
  final NetworkImage image;
  const MyCard({
    Key? key,
    required this.balance,
    required this.cardNumber,
    required this.month,
    required this.year,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Container(
            width: 300,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: image,
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Text('Balance',
                    style: TextStyle(
                      color: Colors.white,
                    )),
                SizedBox(height: 20),
                Text('\$' + balance.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                    )),
                SizedBox(height: 30),
                Text('Account Number',
                    style: TextStyle(
                      color: Colors.white,
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(cardNumber.toString(),
                        style: TextStyle(
                          color: Colors.white,
                        )),
                    Text(month.toString() + '/' + year.toString(),
                        style: TextStyle(
                          color: Colors.white,
                        )),
                  ],
                )
              ],
            )));
  }
}
