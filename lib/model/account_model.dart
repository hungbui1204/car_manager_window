class Account {
  String? user;
  String? password;

  Account({this.user, this.password});

  Account.fromJson(Map<String, dynamic> json) {
    user = json['user'];
    password = json['password'];
  }
}