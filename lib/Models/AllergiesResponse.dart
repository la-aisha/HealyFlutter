import 'dart:convert';

AllergiesResponse allergiesResponse(String str) => AllergiesResponse.fromJson(jsonDecode(str));

class AllergiesResponse {
  int? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? nom;
  String? description;

  AllergiesResponse(
      {this.id, this.createdAt, this.updatedAt, this.nom, this.description});



    AllergiesResponse.fromJson(Map<String, dynamic> json) {
  id = json['id'];
  createdAt = DateTime.tryParse(json['created_at'] ?? '');
  updatedAt = DateTime.tryParse(json['updated_at'] ?? '');
  nom = json['nom'];
  description = json['description'];
}


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['nom'] = this.nom;
    data['description'] = this.description;
    return data;
  }
}
