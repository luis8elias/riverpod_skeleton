import '/data/models/forrm_model.dart';
import '/tools/validate_helper.dart';

class LoginModel extends FormModel{
  
  final String? email;
  final String? password;

  LoginModel({this.email, this.password});

  LoginModel copyWith({
    String? email,
    String? password,
  }) {
    return LoginModel(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
  
  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
    };
  }

  @override
  bool get isValid =>
  (
    (email == null ? false : ValidateHelper.validateEmail(email) == null ) &&
    (password == null? false : ValidateHelper.validateRequired(password) == null)
  );
  
}
