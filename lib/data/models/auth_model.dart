import 'dart:convert';

AuthModel authModelFromJson(String str) => AuthModel.fromJson(json.decode(str));

String authModelToJson(AuthModel data) => json.encode(data.toJson());

class AuthModel {

  AuthModel({
    required this.token,
    required this.refreshToken,
  });

  final String token;
  final String refreshToken;
  
  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
      token: json["token"],
      refreshToken: json["refreshToken"],
  );

  Map<String, dynamic> toJson() => {
      "token": token,
      "refreshToken": refreshToken,
  };
}