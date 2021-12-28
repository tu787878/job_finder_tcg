import 'package:flutter/material.dart';
import 'package:job/constants.dart';
import 'package:job/models/JobResponse.dart';
import 'package:job/models/job_model.dart';

class CompanyCard2 extends StatelessWidget {
  final JobResponse? job;
  CompanyCard2({required this.job});
  @override
  Widget build(BuildContext context) {
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
                style: kTitleStyle,
              ),
            ],
          ),
          SizedBox(height: 15.0),
          Text(
            job!.job.jobName,
            style: kTitleStyle,
          ),
          SizedBox(height: 15.0),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: job!.job.business.businessName,
                  style: kSubtitleStyle,
                ),
                TextSpan(
                  text: "  •  ",
                  style: kSubtitleStyle,
                ),
                TextSpan(
                  text: job!.job.business.businessCategory.name,
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
                children: job!.job.jobTags
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
              Text(
                "${job!.subscribers} đăng kí",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
