import 'package:job/models/city_model.dart';
import 'package:job/models/job_category_model.dart';

class UserModel {
  final int id;
  final String userId;
  final String firstName;
  final String lastName;
  final String birthday;
  final String address;
  final int postCode;
  final CityModel city;
  final int phone;
  final int gender;
  final List<JobCategoryModel> jobCategories;
  final String description;
  final String avatar;

  const UserModel({
    required this.id,
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.birthday,
    required this.address,
    required this.postCode,
    required this.city,
    required this.phone,
    required this.gender,
    required this.jobCategories,
    required this.description,
    required this.avatar,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] != null ? json['id'] : '',
      userId: json['userId'] != null ? json['userId'] : '',
      firstName: json['firstName'] != null ? json['firstName'] : '',
      lastName: json['lastName'] != null ? json['lastName'] : '',
      birthday: json['birthday'] != null ? json['birthday'] : '',
      address: json['address'] != null ? json['address'] : '',
      postCode: json['postCode'] != null ? json['postCode'] : '',
      city: CityModel.fromJson(json["city"]),
      phone: json['phone'] != null ? json['phone'] : '',
      gender: json['gender'] != null ? json['gender'] : '',
      jobCategories: json['jobCategories']
          .map<JobCategoryModel>((data) => JobCategoryModel.fromJson(data))
          .toList(),
      description: json['description'] != null ? json['description'] : '',
      avatar: json['avatar'] != null ? json['avatar'] : '',
    );
  }
}
