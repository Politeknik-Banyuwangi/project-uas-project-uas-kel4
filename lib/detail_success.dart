import 'package:flutter/material.dart';

class DetailSuccess extends StatelessWidget {
  Map<String, dynamic> data;
  DetailSuccess({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Presensi'),
        backgroundColor: Colors.red.shade700,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          padding: const EdgeInsets.all(15.0),
          height: 220,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 10.0,
                spreadRadius: 2.0,
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text('Detail Presensi', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
              const SizedBox(height: 15.0),
              const Divider(
                color: Colors.black,
                thickness: 1.0,
              ),
              const SizedBox(height: 15.0),
              Row(
                children: [
                  const Text('Tipe : '),
                  Text(data['type']),
                ],
              ),
              const SizedBox(height: 10.0),
              Row(
                children: [
                  const Text('Tanggal : '),
                  Text(data['date']),
                ],
              ),
              const SizedBox(height: 10.0),
              Row(
                children: [
                  const Text('Jam : '),
                  Text(data['time_in']),
                ],
              ),
              const SizedBox(height: 10.0),
              Row(
                children: [
                  const Text('Keterangan : '),
                  Text(data['description']),
                ],
              ),
              const SizedBox(height: 10.0),
            ],
          ),
        ),
      ),
    );
  }
}
