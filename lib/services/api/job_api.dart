import 'dart:convert';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:job/models/JobResponse.dart';
import 'package:job/models/city_model.dart';
import 'package:job/models/job_category_model.dart';
import 'package:job/models/job_tag_model.dart';
import 'package:job/models/query_search.dart';
import 'package:job/models/url_model.dart';
import 'package:job/services/auth/Auth.dart';

class JobApi {
  late final Box box = Hive.box('authenticationBox');
  late final String host = UrlModel.toUrl();

  Future<List<JobResponse>> getHotJobs(Jobquery query) async {
    var token = box.get('access_token');
    if (token != null) {
      String url = "";
      if (AuthService().isBusiness()) {
        var businessId = box.get('business_id');
        url = host +
            "/api/business/${businessId}/relateJob" +
            query.parseToParam();
      } else {
        var userId = box.get('user_id');
        url = host + "/api/user/${userId}/relateJob" + query.parseToParam();
      }

      // print(url);
      final response = await http.get(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ' + token.toString(),
        },
      );

      if (response.statusCode == 200 || response.statusCode == 400) {
        List<JobResponse> jobModels =
            json.decode(response.body)['data']['jobs'].map<JobResponse>((data) {
          return new JobResponse.fromJson(data);
        }).toList();
        return jobModels;
      } else {
        throw Exception('Api fail!');
      }
    } else {
      throw Exception('Api fail!');
    }
  }

  Future<List<JobResponse>> getNewJobs(QuerySearch query) async {
    var token = box.get('access_token');
    if (token != null) {
      String url = host + "/api/jobs";
      final response = await http.get(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ' + token.toString(),
        },
      );

      if (response.statusCode == 200 || response.statusCode == 400) {
        List<JobResponse> jobModels =
            json.decode(response.body)['data']['jobs'].map<JobResponse>((data) {
          return new JobResponse.fromJson(data);
        }).toList();
        return jobModels;
      } else {
        throw Exception('Api fail!');
      }
    } else {
      throw Exception('Api fail!');
    }
  }

  Future<List<JobCategoryModel>> getJobCategories() async {
    var token = box.get('access_token');
    if (token != null) {
      String url = host + "/api/jobCategory";
      final response = await http.get(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ' + token.toString(),
        },
      );
      // print(response.statusCode);
      // jsonDecode(utf8.decode(response.bodyBytes))
      // print(json.decode(response.body)['data']['business']);
      if (response.statusCode == 200 || response.statusCode == 400) {
        // print(json.decode(response.body)['data']['jobs'][0]["business"]);
        var res = jsonDecode(utf8.decode(response.bodyBytes));

        List<JobCategoryModel> jobCategories =
            res['data']['jobCategories'].map<JobCategoryModel>((data) {
          return new JobCategoryModel.fromJson(data);
        }).toList();

        return jobCategories;
      } else {
        throw Exception('Api fail!');
      }
    } else {
      throw Exception('Api fail!');
    }
  }

  Future<List<CityModel>> getCities() async {
    var token = box.get('access_token');
    if (token != null) {
      String url = host + "/api/jobCity";
      final response = await http.get(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ' + token.toString(),
        },
      );
      // print(response.statusCode);
      // jsonDecode(utf8.decode(response.bodyBytes))
      // print(json.decode(response.body)['data']['business']);
      if (response.statusCode == 200 || response.statusCode == 400) {
        // print(json.decode(response.body)['data']['jobs'][0]["business"]);
        var res = jsonDecode(utf8.decode(response.bodyBytes));

        List<CityModel> cities = res['data']['cities'].map<CityModel>((data) {
          return new CityModel.fromJson(data);
        }).toList();

        return cities;
      } else {
        throw Exception('Api fail!');
      }
    } else {
      throw Exception('Api fail!');
    }
  }

  Future<List<JobTagModel>> getJobTags() async {
    var token = box.get('access_token');
    if (token != null) {
      String url = host + "/api/jobTag";
      final response = await http.get(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ' + token.toString(),
        },
      );
      // print(response.statusCode);
      // jsonDecode(utf8.decode(response.bodyBytes))
      // print(json.decode(response.body)['data']['business']);
      if (response.statusCode == 200 || response.statusCode == 400) {
        // print(json.decode(response.body)['data']['jobs'][0]["business"]);
        var res = jsonDecode(utf8.decode(response.bodyBytes));

        List<JobTagModel> tags = res['data']['tags'].map<JobTagModel>((data) {
          return new JobTagModel.fromJson(data);
        }).toList();

        return tags;
      } else {
        throw Exception('Api fail!');
      }
    } else {
      throw Exception('Api fail!');
    }
  }
}
