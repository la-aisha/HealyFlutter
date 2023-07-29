import 'dart:convert';
// ignore: depend_on_referenced_packages
//import 'package:equatable/equatable.dart';


class User {
 final String id;
  final String? email;
  final String? password;
  final String? number;
  final String? firstname;
  final String? lastname;

  final String? speciality_id;
  final String? hopital_id;
  final String? allergies_id;
  final String? file;

   User({
    required this.id,
     this.email,
     this.password,
     this.number,
     this.firstname,
     this.lastname,
    this.speciality_id,
    this.hopital_id,
    this.file,
    this.allergies_id,
  });

  final empty = User(id: '');

  /* bool get isEmpty ==> this == User.empty ;
  bool get isNotEmpty ==> this != User.empty ; */

}
