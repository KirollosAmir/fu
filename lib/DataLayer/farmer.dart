class Farmer {
  String id;
  String name;
  String mobile;
  String password;
  Farmer({this.id, this.name, this.mobile, this.password});
  Farmer.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    mobile = json['mobile'];
    password = json['password'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['mobile'] = this.mobile;
    data['password'] = this.password;
    return data;
  }
}
