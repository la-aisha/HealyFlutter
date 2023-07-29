import 'dart:convert';

import 'package:hopital/Models/AllergiesResponse.dart';
import 'package:hopital/Services/config.dart';
import 'package:http/http.dart' as http;

class ApiService {
//client
  static var client = http.Client();

// list alllergies

  static Future<List<AllergiesResponse>> getAllAllergies() async {
    
    try {
    var url = Uri.parse('${Config.apiUrl}${Config.allergies}');
    var response = await client.get(url);



    if (response.statusCode == 200) {
      /* final jsonData = allergiesResponse(response.body) as List;
      final allergiesList = jsonData.map((data) => AllergiesResponse.fromJson(data)).toList(); */
      //final jsonData = jsonDecode(response.body) as List;
     final jsonData = jsonDecode(response.body) as List<dynamic>;

      final allergiesList = jsonData.map((data) => AllergiesResponse.fromJson(data)).toList();

      print(jsonData); // Ch
      print(allergiesList); // Check the parsed data

      if (jsonData.isEmpty) {
        return []; // Return an empty list for empty API response
      }

      

      return allergiesList;
    } else {
      return [];
    }
  } catch (e) {
    return [];
  }
  }
  }

//register medecin

//register patient

//

