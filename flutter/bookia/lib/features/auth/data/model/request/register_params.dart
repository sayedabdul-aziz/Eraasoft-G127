// {
//     "name" : "Sayed",
//     "email" : "sayed1100@gmail.com",
//     "password":"12345678",
//     "password_confirmation" :"12345678"
// }

class RegisterParams {
  String? name;
  String? email;
  String? password;
  String? passwordConfirmation;

  RegisterParams({
    this.name,
    this.email,
    this.password,
    this.passwordConfirmation,
  });

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "password": password,
      "password_confirmation": passwordConfirmation,
    };
  }
}
