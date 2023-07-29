

import 'dart:convert';

RegisterResponse registerEmailResponse(String str)=>RegisterResponse.fromJson(jsonDecode(str));


class RegisterResponse {
  String? message;
  Data ?data;
  String? token;

  RegisterResponse({this.message, this.data, this.token});

  RegisterResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['token'] = this.token;
    return data;
  }
}

class Data {
  int? id;
  String? createdAt;
  String? updatedAt;
  String? firstname;
  String? lastname;
  String? address;
  int? isActivated;
  String? email;
  String? number;
  String? ddn;
  int? userId;
  int? hopitalId;
  int? specialityId;

  Data(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.firstname,
      this.lastname,
      this.address,
      this.isActivated,
      this.email,
      this.number,
      this.ddn,
      this.userId,
      this.hopitalId,
      this.specialityId});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    address = json['address'];
    isActivated = json['is_activated'];
    email = json['email'];
    number = json['number'];
    ddn = json['ddn'];
    userId = json['user_id'];
    hopitalId = json['hopital_id'];
    specialityId = json['speciality_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['address'] = this.address;
    data['is_activated'] = this.isActivated;
    data['email'] = this.email;
    data['number'] = this.number;
    data['ddn'] = this.ddn;
    data['user_id'] = this.userId;
    data['hopital_id'] = this.hopitalId;
    data['speciality_id'] = this.specialityId;
    return data;
  }
}
