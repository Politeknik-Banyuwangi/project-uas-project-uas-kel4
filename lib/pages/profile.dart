import 'package:flutter/material.dart';

class ProfilePages extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile', style: TextStyle(color: Colors.black)),
        backgroundColor: Color(0xffFFFFFF),
        elevation: 0,
        actions: <Widget>[],
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
                  padding: const EdgeInsets.only(left: 25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Shella Ananta', style: TextStyle(fontSize: 20, color: Colors.black)),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                                padding: const EdgeInsets.only(left: 4.0),
                                child: Text(
                                  'Politeknik Negeri Banyuwangi ',
                                  style: TextStyle(color: Colors.black, fontSize: 18, wordSpacing: 2),
                                )),
                          ],
                        ),
                      ),
                    ],
                  )),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 30, right: 20, left: 30, bottom: 0),
            child: Text('Biodata Mahasiswa', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.black)),
          ),
          //biodata
          Container(
            padding: EdgeInsets.fromLTRB(4.0, 45.0, 4.0, 3.0),
            margin: EdgeInsets.fromLTRB(5.0, 2.0, 5.0, 4.0),
            height: 450,
            width: double.infinity,
            child: Card(
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.purple[200],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(children: <Widget>[
                          Icon(Icons.person_pin),
                          Text('Nama       : Shella Ananta', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18))
                        ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(children: <Widget>[
                          Icon(Icons.dialpad),
                          Text('NIM         : 312810427', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18))
                        ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(children: <Widget>[
                          Icon(Icons.school),
                          Text('Prodi        : Teknik Informatika', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18))
                        ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(children: <Widget>[
                          Icon(Icons.date_range),
                          Text('TTL           : Banyuwangi,17-10-2000', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))
                        ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(children: <Widget>[
                          Icon(Icons.contact_mail),
                          Text('E-mail      : Shella17@gmail.com', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18))
                        ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(children: <Widget>[
                          Icon(Icons.contact_phone),
                          Text('Telepon   : 082783541470', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18))
                        ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(children: <Widget>[
                          Icon(Icons.home),
                          Text('Alamat    : Banyuwangi', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18))
                        ]),
                      ),
                    ],
                  )),
            ),
          )
        ],
      ),
    );
  }
}
