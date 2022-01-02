import 'package:flutter/material.dart';
import 'package:job/constants.dart';
import 'package:job/models/JobResponse.dart';
import 'package:job/models/job_model.dart';

class CompanyCard2 extends StatelessWidget {
  final JobResponse jobResponse;
  CompanyCard2({required this.jobResponse});

  @override
  Widget build(BuildContext context) {
    JobModel job = jobResponse.job;
    return Container(
      width: 300.0,
      height: 200.0,
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
                    image:
                        NetworkImage(jobResponse.job.business.businessLogoPath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    job.salaryFrom.toString() +
                        "€/h - " +
                        job.salaryTo.toString() +
                        "€/h",
                    style: kTitleStyle,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: job.business.businessName,
                          style: kSubtitleStyle,
                        ),
                        TextSpan(
                          text: "  •  ",
                          style: kSubtitleStyle,
                        ),
                        TextSpan(
                          text: job.business.businessCategory.name,
                          style: kSubtitleStyle,
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(height: 15.0),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: Text(
                job.jobName,
                style: kTitleStyle.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              )),
              Text(
                jobResponse.subscribers.toString() + " đăng kí",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ],
          ),
          SizedBox(height: 15.0),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: job.jobTags
                      .map(
                        (e) => Container(
                          height: 35,
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(right: 10.0),
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 5.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            color: Colors.grey[200],
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
                Container(
                  height: 35,
                  child: TextButton(
                    child: Text("Đăng kí"),
                    onPressed: () {
                      // send api apply job
                      print("job status: ${jobResponse.isApplied}");
                    },
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
