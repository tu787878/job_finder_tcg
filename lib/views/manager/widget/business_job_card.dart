import 'package:flutter/material.dart';
import 'package:job/constants.dart';
import 'package:job/models/applied_job_response.dart';
import 'package:job/models/business_model.dart';
import 'package:job/models/company.dart';
import 'package:job/models/job_model.dart';
import 'package:job/services/api/job_api.dart';
import 'package:job/views/findJob/job_detail.dart';

class BusinessAppliedJobCard extends StatelessWidget {
  final AppliedJobResponse? appliedJobResponse;

  BusinessAppliedJobCard({required this.appliedJobResponse});
  @override
  Widget build(BuildContext context) {
    JobModel job = appliedJobResponse!.job;
    return Container(
      width: 280.0,
      // height: 200.0,
      margin: EdgeInsets.only(right: 15.0, bottom: 15.0),
      padding: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  image: DecorationImage(
                    image: NetworkImage(job.business.businessLogoPath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Spacer(),
              Text(
                appliedJobResponse!.dateTime,
                style: kTitleStyle,
              ),
            ],
          ),
          SizedBox(height: 15.0),
          Text(
            appliedJobResponse!.user.firstName +
                "  " +
                appliedJobResponse!.user.lastName,
            style: kTitleStyle,
          ),
          SizedBox(height: 15.0),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: job.jobName,
                  style: kSubtitleStyle,
                ),
                TextSpan(
                  text: "  •  ",
                  style: kSubtitleStyle,
                ),
                TextSpan(
                  text: job.jobCategory.name,
                  style: kSubtitleStyle,
                ),
              ],
            ),
          ),
          SizedBox(height: 15.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: job.jobTags
                    .map(
                      (e) => Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(right: 10.0),
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          color: Colors.white,
                          border: Border.all(
                            color: kBlack,
                            width: 0.5,
                          ),
                        ),
                        child: Text(
                          e.name,
                          style: kSubtitleStyle.copyWith(
                            fontSize: 12.0,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
              // Text(
              //   appliedJobResponse!.status,
              //   style: TextStyle(
              //     color: Colors.black,
              //   ),
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
