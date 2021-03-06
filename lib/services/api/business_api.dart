import 'dart:convert';
import 'dart:io';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:job/models/JobResponse.dart';
import 'package:job/models/applied_job_response.dart';
import 'package:job/models/business_category_model.dart';
import 'package:job/models/business_model.dart';
import 'package:job/models/job_model.dart';
import 'package:job/models/job_tag_model.dart';
import 'package:job/models/query_search.dart';
import 'package:job/models/url_model.dart';

class BusinessApi {
  late final Box box = Hive.box('authenticationBox');
  late final String host = UrlModel.toUrl();

  Future<BusinessModel> getBusiness() async {
    var token = box.get('access_token');
    var businessId = box.get('business_id');
    if (token != null) {
      String url = host + "/api/business/${businessId}";
      final response = await http.get(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ' + token.toString(),
        },
      );
      // print(json.decode(response.body)['data']['business']);
      if (response.statusCode == 200 || response.statusCode == 400) {
        BusinessModel businessModel = BusinessModel.fromJson(
            json.decode(response.body)['data']['business']);
        return businessModel;
      } else {
        throw Exception('Fail to load data!');
      }
    }
    throw Exception('Fail to load data!');
  }

  Future<List<JobResponse>> getJobs(Jobquery querySearch) async {
    var token = box.get('access_token');
    var businessid = await box.get('business_id');
    if (token != null) {
      String url = host +
          "/api/business/${businessid}/jobs" +
          querySearch.parseToParam();
      print(url);
      final response = await http.get(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ' + token.toString(),
        },
      );
      //print(json.decode(response.body)['data']['jobs']);
      // print(json.decode(response.body)['data']['business']);
      if (response.statusCode == 200 || response.statusCode == 400) {
        List<JobResponse> jobModels = json
            .decode(response.body)['data']['jobs']
            .map<JobResponse>((data) => new JobResponse.fromJson(data))
            .toList();

        return jobModels;
      } else {
        throw Exception('Fail to load data!');
      }
    }
    throw Exception('Fail to load data!');
  }

  Future<List<BusinessCategoryModel>> getBusinessCategories() async {
    var token = box.get('access_token');
    if (token != null) {
      String url = host + "/api/businessCategory";
      final response = await http.get(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ' + token.toString(),
        },
      );
      // print(json.decode(response.body)['data']['jobs']);
      // print(json.decode(response.body)['data']['business']);
      if (response.statusCode == 200 || response.statusCode == 400) {
        List<BusinessCategoryModel> categories = json
            .decode(response.body)['data']['businessCategories']
            .map<BusinessCategoryModel>(
                (data) => new BusinessCategoryModel.fromJson(data))
            .toList();
        print("categories[0].categoryId");
        print(categories.length);
        return categories;
      } else {
        throw Exception('Fail to load data!');
      }
    }
    throw Exception('Fail to load data!');
  }

  Future<bool> saveBusinessProfile(BusinessModel business, File? image) async {
    var token = box.get('access_token');
    var businessId = box.get('business_id');
    if (token != null) {
      String url = host + "/api/business/${businessId}";
      List<int> imageBytes = image!.readAsBytesSync();
      String baseimage = base64Encode(imageBytes);
      final response = await http.put(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ' + token.toString(),
        },
        body: jsonEncode(<String, String>{
          'businessName': business.businessName,
          'businessId': business.businessId,
          'businessAddress': business.businessAddress,
          'businessDescription': business.businessDescription,
          'businessCategoryId': business.businessCategory.categoryId,
          'image': baseimage,
        }),
      );
      print(json.decode(response.body));
      // print(json.decode(response.body)['data']['business']);
      if (response.statusCode == 200 || response.statusCode == 400) {
        return true;
      } else {
        throw Exception('Fail to load data!');
      }
    }
    throw Exception('Fail to load data!');
  }

  Future<bool> newJob(JobModel job) async {
    var token = box.get('access_token');
    var businessId = box.get('business_id');
    if (token != null) {
      String url = host + "/api/business/${businessId}/jobs";
      String jobTags = "";
      if (job.jobTags.length > 0) {
        for (var i = 0; i < job.jobTags.length; i++) {
          JobTagModel jobTag = job.jobTags[i];
          jobTags = jobTags + jobTag.id.toString();
          if (i != job.jobTags.length - 1) jobTags = jobTags + ",";
        }
      }
      print(jobTags);

      final response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ' + token.toString(),
        },
        body: jsonEncode(<String, String>{
          "jobName": job.jobName,
          "business": job.business.toString(),
          "jobDescription": job.jobDescription,
          "jobAddress": job.jobAddress,
          "workingTime": job.workingTime,
          "note": job.note,
          "jobLatitude": job.jobLatitude.toString(),
          "jobLongitude": job.jobLongitude.toString(),
          "salaryFrom": job.salaryFrom.toString(),
          "salaryTo": job.salaryTo.toString(),
          "createdTime": job.createdTime,
          "expiredTime": job.expiredTime,
          "jobCategoryId": job.jobCategory.id.toString(),
          "cityId": job.city.id.toString(),
          "jobRequirements": job.jobRequirements,
          "jobBenefits": job.jobBenefits,
          "jobTagsId": jobTags,
          "active": job.active.toString(),
          "postCode": job.post_code.toString(),
        }),
      );
      print(json.decode(response.body));
      // print(json.decode(response.body)['data']['business']);
      if (response.statusCode == 200 || response.statusCode == 400) {
        return true;
      } else {
        throw Exception('Fail to load data!');
      }
    }
    throw Exception('Fail to load data!');
  }

  Future<List<AppliedJobResponse>> getAppliedJob(Jobquery query) async {
    var token = box.get('access_token');
    var businessId = box.get('business_id');
    if (token != null) {
      String url = host + "/api/business/${businessId}/appliedJob";
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
}
