import 'package:job/models/job_model.dart';

class JobResponse {
  JobModel job;
  int subscribers;
  bool isApplied;
  String statusApplied;

  JobResponse({
    required this.job,
    required this.subscribers,
    required this.isApplied,
    required this.statusApplied,
  });

  factory JobResponse.fromJson(Map<String, dynamic> json) {
    return JobResponse(
      job: JobModel.fromJson(json['job']),
      subscribers: json['subscribers'] != null ? json['subscribers'] : '',
      isApplied: json['isApplied'] != null ? json['isApplied'] : '',
      statusApplied:
          json['statusApplied'] != null ? json['statusApplied'] : null,
    );
  }
}
