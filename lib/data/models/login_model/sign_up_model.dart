class SignUpModel {
  String? pk;
  String? username;
  String? firstName;
  String? lastName;
  String? email;
  bool? isVerified;

  SignUpModel(
      {this.pk,
        this.username,
        this.firstName,
        this.lastName,
        this.email,
        this.isVerified});

  SignUpModel.fromJson(Map<String, dynamic> json) {
    pk = json['pk'];
    username = json['username'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    isVerified = json['is_verified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pk'] = this.pk;
    data['username'] = this.username;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['is_verified'] = this.isVerified;
    return data;
  }
}

class SignUpError {
  List<String>? email;
  List<String>? password;

  SignUpError({this.email, this.password});

  SignUpError.fromJson(Map<String, dynamic> json) {
    email = json['email'].cast<String>();
    password = json['password'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}