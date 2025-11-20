import 'dart:convert' ;

//import 'package:good_health/util/config.dart';
import 'package:http/http.dart' as http;
import 'package:good_health/util/api.dart';

class Pasien {
  final String idPasien, nama, hp, email;

  Pasien({required this.idPasien, required this.nama, required this.hp, required this.email});

  factory Pasien.fromJson(Map<String, dynamic> json) {
    return Pasien(
        idPasien: json['id_pasien'].toString(),
        nama: json['nama'].toString(),
        hp: json['hp'].toString(),
        email: json['email'].toString());
  }
}

List<Pasien> pasienFromJson(jsonData) {
  List<Pasien> result =
      List<Pasien>.from(jsonData.map((item) => Pasien.fromJson(item)));

  return result;
}

// register pasien (POST)
Future pasienCreate(Pasien pasien) async {
  //String route = AppConfig.API_ENDPOINT + "/pasien/create.php";
  try { 
        final uri = Api.endpoint('/pasien/create.php');
        final response = await http.post(
        uri,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(
            {'nama': pasien.nama, 'hp': pasien.hp, 'email': pasien.email}));

    return response;
  } catch (e) {
    print("Error : ${e.toString()}");
    return null;
  }
}
