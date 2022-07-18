class User {
  final int id;
  final String name;
  final String phone;
  final String email;
  final String city;

  User(this.id, this.name, this.phone, this.email, this.city);

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        phone = json['phone'],
        email = json['email'],
        city = json['address']['city'];
}
