class ProfileAccess {
  String? pk;
  String? username;
  String? firstName;
  String? lastName;
  String? email;
  String? gender;
  String? notes;
  bool? isVerified;

  ProfileAccess(
      {this.pk,
      this.username,
      this.firstName,
      this.lastName,
      this.email,
      this.gender,
      this.notes,
      this.isVerified});

  ProfileAccess.fromJson(Map<String, dynamic> json) {
    pk = json['pk'];
    username = json['username'];
    firstName = json['first_name'];
    lastName = json['last_name'];

    email = json['email'];
    gender = json['gender'];

    notes = json['notes'];
    isVerified = json['is_verified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pk'] = this.pk;
    data['username'] = this.username;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;

    data['email'] = this.email;
    data['gender'] = this.gender;

    data['notes'] = this.notes;
    data['is_verified'] = this.isVerified;
    return data;
  }
}
