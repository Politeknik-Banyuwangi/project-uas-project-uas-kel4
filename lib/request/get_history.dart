import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<List<HistoryRequest>> fetchHistoryData() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();

  final String? _token = _prefs.getString('_token');
  final response = await http.get(
    Uri.parse('http://192.168.100.83:8000/api/v1/presences/get-data'),
    headers: {
      'Content-Type': 'application/json',
      'X-Requested-With': 'XMLHttpRequest',
      'Authorization': "Bearer ${_token}",
    },
  );

  if (response.statusCode == 200) {
    final parsed = jsonDecode(response.body)['data'].cast<Map<String, dynamic>>();

    return parsed
        .map<HistoryRequest>((json) => HistoryRequest.fromJson(json))
        .toList();
  } else {
    throw Exception('Failed to load data');
  }
}

class HistoryRequest {
  final String date, timeIn, type;

  HistoryRequest({
    required this.date,
    required this.timeIn,
    required this.type,
  });

  factory HistoryRequest.fromJson(Map<String, dynamic> json) {
    return HistoryRequest(
      date: json['date'].toString(),
      timeIn: json['time_in'].toString(),
      type: json['type'].toString(),
    );
  }
}
