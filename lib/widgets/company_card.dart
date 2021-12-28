import 'package:flutter/material.dart';
import 'package:job/constants.dart';
import 'package:job/models/JobResponse.dart';
import 'package:job/models/business_model.dart';
import 'package:job/models/company.dart';
import 'package:job/models/job_model.dart';
import 'package:job/services/api/job_api.dart';
import 'package:job/views/findJob/job_detail.dart';

class CompanyCard extends StatelessWidget {
  final JobResponse? job;
  CompanyCard({required this.job});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280.0,
      height: 200.0,
      margin: EdgeInsets.only(right: 15.0, bottom: 15.0),
      padding: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: kBlack,
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
                    image: NetworkImage(job!.job.business.businessLogoPath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Spacer(),
              Text(
                job!.job.salaryFrom.toString() +
                    "€/h - " +
                    job!.job.salaryTo.toString() +
                    "€/h",
                style: kTitleStyle.copyWith(color: Colors.white),
              ),
            ],
          ),
          SizedBox(height: 15.0),
          Text(
            job!.job.jobName,
            style: kTitleStyle.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 15.0),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: job!.job.business.businessName,
                  style: kSubtitleStyle.copyWith(
                    color: Colors.white,
                  ),
                ),
                TextSpan(
                  text: "  •  ",
                  style: kSubtitleStyle.copyWith(
                    color: Colors.white,
                  ),
                ),
                TextSpan(
                  text: job!.job.business.businessCategory.name,
                  style: kSubtitleStyle.copyWith(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15.0),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: job!.job.jobTags
                      .map(
                        (e) => Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(right: 10.0),
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 5.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            color: kBlackAccent,
                          ),
                          child: Text(
                            e.name,
                            style: kSubtitleStyle.copyWith(
                              color: Colors.white,
                              fontSize: 12.0,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
                Text(
                  "${job!.subscribers} đăng kí",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
