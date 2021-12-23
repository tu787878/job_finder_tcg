import 'package:job/models/job_model.dart';
import 'package:job/models/user.dart';

class AppliedJobResponse {
  final int id;
  final UserModel user;
  final String businessId;
  final JobModel job;
  final String status;

  AppliedJobResponse({
    required this.id,
    required this.user,
    required this.businessId,
    required this.job,
    required this.status,
  });

  factory AppliedJobResponse.fromJson(Map<String, dynamic> json) {
    return AppliedJobResponse(
      id: json['id'] != null ? json['id'] : '',
      user: UserModel.fromJson(json['userId']),
      businessId: json['businessId'] != null ? json['businessId'] : '',
      job: JobModel.fromJson(json['job']),
      status: json['status'] != null ? json['status'] : '',
    );
  }
}
