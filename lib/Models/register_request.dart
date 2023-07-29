import 'dart:convert';

class RegisterRequest {

  RegisterRequest({
    required this.email,
    required this.password,
    required this.number,
    required this.firstname,
    required this.lastname,
    this.speciality_id,
    this.hopital_id,
    this.file ,
    this.allergies_id,

  });
  String? email;
  String? password;
  String? number;
  String? firstname;
  String? lastname;

  String? speciality_id;
  String? hopital_id;
  String? allergies_id;

  String? file ;

  
  RegisterRequest.fromJson(Map<String, dynamic> json){
    email = json['email'];
    password = json['password'];
    number = json['number'];
    firstname = json['firstname'];
    lastname = json['lastname']; 

    lastname = json['speciality_id']; 
    lastname = json['hopital_id']; 
    lastname = json['file']; 
    lastname = json['allergies_id']; 

  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['email'] = email;
    _data['password'] = password;
    _data['number'] = number;
    _data['firstname'] = firstname;
    _data['lastname'] = lastname;

        _data['speciality_id'] = speciality_id;
    _data['hopital_id'] = hopital_id;
    _data['file'] = file;
    _data['allergies_id'] = allergies_id;

    return _data;
  }
}