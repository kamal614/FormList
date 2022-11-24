// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<Welcome> welcomeFromJson(String str) =>
    List<Welcome>.from(json.decode(str).map((x) => Welcome.fromJson(x)));

String welcomeToJson(List<Welcome> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Welcome {
  Welcome({
    required this.name,
    required this.ange,
    required this.jobProfile,
  });

  String name;
  String ange;
  String jobProfile;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        name: json["name"],
        ange: json["ange"],
        jobProfile: json["job_profile"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "ange": ange,
        "job_profile": jobProfile,
      };
}
