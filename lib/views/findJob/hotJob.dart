import 'package:flutter/material.dart';
import 'package:job/constants.dart';
import 'package:job/models/job_filter_model.dart';
import 'package:job/models/query_search.dart';
import 'package:job/services/api/job_api.dart';
import 'package:job/views/findJob/jobLoadingSkeleton.dart';
import 'package:job/views/findJob/job_detail.dart';
import 'package:job/widgets/company_card.dart';
import 'package:job/widgets/company_card2.dart';
import 'package:provider/provider.dart';

class HotJob extends StatefulWidget {
  HotJob({Key? key}) : super(key: key);

  @override
  _HotJobState createState() => _HotJobState();
}

class _HotJobState extends State<HotJob> {
  var relateJobData = [];

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    var result = await JobApi().getHotJobs(queryNewJobsBasic);
    setState(() => {this.relateJobData = result});
  }

  @override
  Widget build(BuildContext context) {
    JobFilterModel filter = Provider.of<JobFilterModel>(context);
    return (Wrap(children: [
      Text(
        "Dành cho bạn ${filter.getJobFrom()}",
        style: kTitleStyle,
      ),
      SizedBox(height: 15.0),
      Container(
        width: double.infinity,
        height: 200.0,
        child: relateJobData.length != 0
            ? ListView.builder(
                itemCount: relateJobData.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  var job = relateJobData[index];
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
                        ? CompanyCard(jobResponse: job)
                        : CompanyCard2(jobResponse: job),
                  );
                },
              )
            : JobLoadingSkeleton(),
      )
    ]));
  }
}
