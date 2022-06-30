import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<ProfileRequest> fetchProfileData() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();

  final String? _token = _prefs.getString('_token');
  final response = await http.get(
    Uri.parse('http://192.168.100.83:8000/api/v1/get-profile'),
    headers: {
      'Content-Type': 'application/json',
      'X-Requested-With': 'XMLHttpRequest',
      'Authorization': "Bearer ${_token}",
    },
  );

  if (response.statusCode == 200) {
    Map<String, dynamic> data = jsonDecode(response.body);
    return ProfileRequest.fromJson(data['data']);
  } else {
    throw Exception('Failed to load data');
  }
}

class ProfileRequest {
  final String id,
      name,
      shiftId,
      nim,
      prodi,
      birthPlace,
      birthDate,
      phone,
      address,
      email;

  ProfileRequest({
    required this.id,
    required this.name,
    required this.shiftId,
    required this.nim,
    required this.prodi,
    required this.birthPlace,
    required this.birthDate,
    required this.phone,
    required this.address,
    required this.email,
  });

  factory ProfileRequest.fromJson(Map<String, dynamic> json) {
    return ProfileRequest(
      id: json['id'].toString(),
      name: json['name'].toString(),
      shiftId: json['shift_id'].toString(),
      nim: json['nim'].toString(),
      prodi: json['prodi'].toString(),
      birthPlace: json['birth_place'].toString(),
      birthDate: json['birth_date'].toString(),
      phone: json['phone'].toString(),
      address: json['address'].toString(),
      email: json['email'].toString(),
    );
  }
}
