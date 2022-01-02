import 'dart:convert';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:job/models/applied_job_response.dart';
import 'package:job/models/query_search.dart';
import 'package:job/models/url_model.dart';
import 'package:job/models/user.dart';

class UserApi {
  late final Box box = Hive.box('authenticationBox');
  late final String host = UrlModel.toUrl();

  Future<List<AppliedJobResponse>> getAppliedJob(QuerySearch query) async {
    var token = box.get('access_token');
    var userId = box.get('user_id');
    if (token != null) {
      String url = host + "/api/user/${userId}/appliedJob";
      final response = await http.get(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ' + token.toString(),
        },
      );

      if (response.statusCode == 200 || response.statusCode == 400) {
        List<AppliedJobResponse> jobModels = json
            .decode(response.body)['data']['jobs']
            .map<AppliedJobResponse>((data) {
          return new AppliedJobResponse.fromJson(data);
        }).toList();

        return jobModels;
      } else {
        throw Exception('Api fail!');
      }
    } else {
      throw Exception('Api fail!');
    }
  }

  Future<List<UserModel>> getRecommendStaff(QuerySearch query) async {
    var token = box.get('access_token');
    if (token != null) {
      String url = host + "/api/user/";
      final response = await http.get(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ' + token.toString(),
        },
      );

      if (response.statusCode == 200 || response.statusCode == 400) {
        List<UserModel> staffList =
            json.decode(response.body)['data']['jobs'].map<UserModel>((data) {
          return new UserModel.fromJson(data);
        }).toList();

        return staffList;
      } else {
        throw Exception('Api fail!');
      }
    } else {
      throw Exception('Api fail!');
    }
  }
}
