import "package:flutter/material.dart";

void main() {
  runApp(const MyApp());
}

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
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        children: [
          //appbar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('E-learning',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
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
          SizedBox(height: 25),

          //card
          Container(
              height: 200,
              child: PageView(scrollDirection: Axis.horizontal, children: [
                MyCard(
                  balance: 2.478,
                  cardNumber: 123456789,
                  month: 02,
                  year: 24,
                  image: NetworkImage('https://static.vecteezy.com/system/resources/previews/006/329/857/non_2x/3d-money-holding-wallet-dollar-coin-on-isolate-background-online-payment-and-money-saving-concept-3d-holding-wallet-render-for-business-bank-finance-investment-vector.jpg'),
                ),
                MyCard(
                  balance: 8.981,
                  cardNumber: 189364127,
                  month: 11,
                  year: 24,
                  image: NetworkImage('https://img.freepik.com/free-photo/3d-money-holding-wallet-pink-coin-banknote-isolate-pink-background-online-payment-payment-concept-3d-holding-wallet-render-business-bank-finance-investment-money-saving_412828-544.jpg?w=2000'),
                ),
                MyCard(
                  balance: 4.127,
                  cardNumber: 995623124,
                  month: 09,
                  year: 25,
                  image: NetworkImage('https://img.freepik.com/free-vector/3d-vector-real-estate-coin-hand-holding-pastel-background-money-saving-loan-house-property-concept-financial-money-investment-stack-coins-tiny-house-bank-blue-background_412828-876.jpg?w=2000'),
                ),
              ])),
          SizedBox(height: 25),

          Container(
            child: Column(children: [
              Bills(),
            ]),
          ),
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

class Bills extends StatefulWidget {
  @override
  _Bills createState() => _Bills();
}

class _Bills extends State<Bills> {
  int _selectedNavbar = 0;
  var _pages = <Widget>[
    Icon(Icons.book, size: 20, color: Colors.blue),
    Icon(Icons.book, size: 20, color: Colors.blue),
    Icon(Icons.book, size: 20, color: Colors.blue),
    Icon(Icons.book, size: 20, color: Colors.blue),
    Icon(Icons.book, size: 20, color: Colors.blue),
    Icon(Icons.book, size: 20, color: Colors.blue),
  ];

  var _titleBills = [
    'Biologi',
    'Kimia',
    'Matematika',
    'Bahasa Inggris',
    'Bahasa Indonesia',
    'Fisika',
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
          // Container(
          //   height: 200,
          //   color: Colors.red,
          // )
          //
          Container(
            height: 200,
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
