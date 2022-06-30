import 'dart:convert';
import "package:flutter/material.dart";
import 'package:projectuas/detail_success.dart';
import 'package:projectuas/widgets/homepagelist.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:projectuas/request/get_history.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<HistoryRequest>> fetchedHistory;

  Future<void> scanQR() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String qrCodeScanRes;

    try {
      qrCodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#f0f0f0', 'Batal', true, ScanMode.QR);
      print(qrCodeScanRes);
    } on PlatformException {
      qrCodeScanRes = "Failed to get platform version.";
    }

    if (!mounted) return;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.2,
            height: MediaQuery.of(context).size.width * 0.2,
            padding: const EdgeInsets.all(25),
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: const CircularProgressIndicator(
              color: Colors.blue,
              backgroundColor: Colors.grey,
            ),
          ),
        );
      },
    );

    final String? _token = prefs.getString('_token');
    final response = await http.post(
      Uri.parse('http://192.168.100.83:8000/api/v1/presences/store'),
      headers: {
        'Content-Type': 'application/json',
        'X-Requested-With': 'XMLHttpRequest',
        'Authorization': 'Bearer ${_token}',
      },
      body: jsonEncode(<String, String>{
        'qr_data': qrCodeScanRes,
      }),
    );

    Navigator.pop(context);
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.all(15.0),
                height: MediaQuery.of(context).size.width * 0.5,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(color: Colors.grey, width: 1.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.check_circle_outline,
                      color: Color(0xFF1B5E20),
                      size: 50.0,
                    ),
                    Text(json['message'], style: const TextStyle(fontSize: 16.0, color: Colors.black)),
                    RaisedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          if(json['data'] != null){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => DetailSuccess(data: json['data'])));
                          }
                          setState(() {
                            fetchedHistory = fetchHistoryData();
                          });
                        },
                        color: Colors.blue.shade900,
                        textColor: Colors.white,
                        child: const Text('Oke')),
                  ],
                ),
              ),
            ),
          );
        },
      );
    } else {
      Map<String, dynamic> json = jsonDecode(response.body);
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.all(15.0),
                height: MediaQuery.of(context).size.width * 0.5,
                width: MediaQuery.of(context).size.width + 0.9,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(color: Colors.grey, width: 1.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.warning_amber_rounded,
                      color: Colors.yellow,
                      size: 50.0,
                    ),
                    Text(json['message'], style: const TextStyle(fontSize: 16.0, color: Colors.black)),
                    RaisedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          setState(() {
                            fetchedHistory = fetchHistoryData();
                          });
                        },
                        color: Colors.blue.shade900,
                        textColor: Colors.white,
                        child: const Text('Oke')),
                  ],
                ),
              ),
            ),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    fetchedHistory = fetchHistoryData();
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
        currentIndex: 1,
        onTap: (idx) {
          if (idx == 0) {
            Navigator.pushNamed(context, '/profile');
          } else if (idx == 2) {
            Navigator.pushNamed(context, '/login');
          }
        },
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
                  const Text('E-learning',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      )),
                  Container(
                    margin: const EdgeInsets.all(20),
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.account_circle, size: 40),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 25),
          Container(
            width: MediaQuery.of(context).size.width - 20,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              color: Colors.white,
            ),
            child: InkWell(
              onTap: () {
                scanQR();
              },
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
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
            ),
          ),
          Container(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
            alignment: Alignment.centerLeft,
            child: const Text(
              'Riwayat Absensi',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          Expanded(
            child: HomeList(
              fetchedHistory: fetchedHistory,
            ),
          ),
        ],
      )),
    );
  }
}
