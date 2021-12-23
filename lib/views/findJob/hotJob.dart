import 'package:flutter/material.dart';
import 'package:job/constants.dart';
import 'package:job/models/JobResponse.dart';
import 'package:job/models/job_model.dart';
import 'package:job/models/query_search.dart';
import 'package:job/services/api/job_api.dart';
import 'package:job/views/findJob/jobLoadingSkeleton.dart';
import 'package:job/views/findJob/job_detail.dart';
import 'package:job/widgets/company_card.dart';
import 'package:job/widgets/company_card2.dart';

class HotJob extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (Column(children: [
      Text(
        "Dành cho bạn",
        style: kTitleStyle,
      ),
      SizedBox(height: 15.0),
      FutureBuilder(
        future: JobApi().getHotJobs(queryNewJobsBasic),
        builder: (context, AsyncSnapshot<List<JobResponse>> snapshot) {
          if (snapshot.hasData) {
            var tuples = snapshot.data;
            return Container(
              width: double.infinity,
              height: 200.0,
              child: ListView.builder(
                itemCount: tuples!.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  var job = tuples[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => JobDetail(
                            job: job.job,
                          ),
                        ),
                      );
                    },
                    child: index == 0
                        ? CompanyCard(job: job.job)
                        : CompanyCard2(job: job.job),
                  );
                },
              ),
            );
          } else if (snapshot.hasError) {
            return Text(
              'There was an error :(',
            );
          } else {
            return JobLoadingSkeleton();
          }
        },
      ),
    ]));
  }
}
