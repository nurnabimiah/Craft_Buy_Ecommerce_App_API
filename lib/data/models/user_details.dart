class UserDetails {
  final String firstName, lastName, shippingAddrees, email, city, mobile;
  final int id;

  UserDetails(this.firstName, this.lastName, this.shippingAddrees, this.email,
      this.city, this.id, this.mobile);

  factory UserDetails.fromJson(Map<String, dynamic> map) {
    return UserDetails(map['firstName'], map['lastName'], map['id'],
        map['shippingAddrees'], map['city'], map[' email'], map['mobile']);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {};
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['id'] = id;
    map['shippingAddrees'] = shippingAddrees;
    map['city'] = city;
    map['mobile'] = mobile;
    map['email'] = email;
    return map;
  }
}
