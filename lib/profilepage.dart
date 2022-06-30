import 'package:flutter/material.dart';
import 'package:projectuas/request/profile_request.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);
  late Future<ProfileRequest> _fetchProfileData;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    _fetchProfileData = fetchProfileData();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.red.shade600,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.undo,
            color: Colors.white,
          ),
        ),
      ),
      //user
      body: ListView(
        children: <Widget>[
          const SizedBox(
            height: 30.0,
          ),
          Row(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                      'https://i.pinimg.com/originals/0f/bb/ac/0fbbac26dcbd2670d1f9442949edb45e.jpg'),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: FutureBuilder<ProfileRequest>(
                    future: _fetchProfileData,
                    builder: (context, snapshot) {
                      if(snapshot.hasData){
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(snapshot.data!.name,
                                style: const TextStyle(fontSize: 20, color: Colors.black)),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                // ignore: prefer_const_literals_to_create_immutables
                                children: <Widget>[
                                  const Padding(
                                      padding: EdgeInsets.only(left: 4.0),
                                      child: Text(
                                        'Politeknik Negeri Banyuwangi ',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            wordSpacing: 2),
                                      )),
                                ],
                              ),
                            ),
                          ],
                        );
                      } else {
                        return Center(
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.1,
                              height: MediaQuery.of(context).size.width * 0.1,
                              child: const CircularProgressIndicator(),
                            ),
                          );
                      }
                    }
                  )),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Center(
            child: Text('Biodata Mahasiswa',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.black)),
          ),
          //biodata
          Container(
            padding: const EdgeInsets.fromLTRB(4.0, 0, 4.0, 3.0),
            margin: const EdgeInsets.fromLTRB(5.0, 20.0, 5.0, 4.0),
            height: 400,
            width: double.infinity,
            child: Card(
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.blue[100],
                  ),
                  child: FutureBuilder<ProfileRequest>(
                      future: _fetchProfileData,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Row(children: <Widget>[
                                  const Icon(Icons.person_pin),
                                  Text('Nama       : ${snapshot.data!.name}',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18))
                                ]),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Row(children: <Widget>[
                                  const Icon(Icons.dialpad),
                                  Text('NIM          : ${snapshot.data!.nim}',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18))
                                ]),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Row(children: <Widget>[
                                  const Icon(Icons.school),
                                  Text('Prodi        : ${snapshot.data!.prodi}',
                                      softWrap: false,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18))
                                ]),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Row(children: <Widget>[
                                  const Icon(Icons.date_range),
                                  Text(
                                      'TTL             : ${snapshot.data!.birthPlace}, ${snapshot.data!.birthDate}',
                                      softWrap: false,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16))
                                ]),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Row(children: <Widget>[
                                  const Icon(Icons.contact_mail),
                                  Text('E-mail      : ${snapshot.data!.email}',
                                      softWrap: false,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18))
                                ]),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Row(children: <Widget>[
                                  const Icon(Icons.contact_phone),
                                  Text('Telepon   : ${snapshot.data!.phone}',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18))
                                ]),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Row(children: <Widget>[
                                  const Icon(Icons.home),
                                  Text('Alamat    : ${snapshot.data!.address}',
                                      softWrap: false,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18))
                                ]),
                              ),
                            ],
                          );
                        } else {
                          return Center(
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.1,
                              height: MediaQuery.of(context).size.width * 0.1,
                              child: const CircularProgressIndicator(),
                            ),
                          );
                        }
                      })),
            ),
          )
        ],
      ),
    );
  }
}
