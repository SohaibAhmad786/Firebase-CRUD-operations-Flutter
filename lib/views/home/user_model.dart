class UserModel {
  String? name;
  String? email;
  int? age;
  String? contact;
  String? jobTitle;

  UserModel({this.name, this.email, this.age, this.contact, this.jobTitle});

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    age = json['age'];
    contact = json['contact'];
    jobTitle = json['job_title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['age'] = age;
    data['contact'] = contact;
    data['job_title'] = jobTitle;
    return data;
  }
}
