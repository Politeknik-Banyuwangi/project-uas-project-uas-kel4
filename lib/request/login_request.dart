import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future loginRequest(
    BuildContext context, String username, String password) async {
  final SharedPreferences _prefs = await SharedPreferences.getInstance();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Please wait...',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Center(
              child: SizedBox(
                height: 40,
                width: 40,
                child: CircularProgressIndicator(),
              ),
            ),
          ],
        ),
      );
    },
  );

  final response = await http.post(
    Uri.parse('http://192.168.100.83:8000/api/v1/auth/login'),
    headers: {
      'Content-Type': 'application/json',
      'X-Requested-With': 'XMLHttpRequest',
    },
    body: jsonEncode(<String, String>{
      'username': username,
      'password': password,
    }),
  );

  Navigator.pop(context);
  if (response.statusCode == 200) {
    Map<String, dynamic> data = jsonDecode(response.body);
    _prefs.setString('_token', data['data']['token'].toString());

    Navigator.pop(context);
    Navigator.pushNamed(context, '/');
  } else {
    if (response.statusCode == 422) {
      Map<String, dynamic> data = jsonDecode(response.body);

      if (data['errors']['username'] != null) {
        _showToast(context, data['errors']['username'][0]);
      }

      if (data['errors']['password'] != null) {
        _showToast(context, data['errors']['password'][0]);
      }
    } else {
      Map<String, dynamic> data = jsonDecode(response.body);

      _showToast(context, data['message']);
    }
  }
}

dynamic _showToast(BuildContext context, String message) {
  final scaffold = ScaffoldMessenger.of(context);
  scaffold.showSnackBar(SnackBar(
      content: Row(children: [
    const Icon(Icons.close_rounded, color: Colors.red),
    const SizedBox(width: 5.0),
    Text(message),
  ])));
}
