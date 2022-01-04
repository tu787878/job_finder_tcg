import 'package:flutter/material.dart';
import 'package:job/constants.dart';
import 'package:job/models/job_filter_model.dart';
import 'package:job/services/api/job_api.dart';
import 'package:job/views/findJob/jobLoadingSkeleton.dart';
import 'package:job/views/findJob/job_detail.dart';
import 'package:job/widgets/company_card.dart';
import 'package:provider/provider.dart';

class HotJob extends StatefulWidget {
  HotJob({Key? key}) : super(key: key);

  @override
  _HotJobState createState() => _HotJobState();
}

class _HotJobState extends State<HotJob> {
  var relateJobData = [];
  JobFilterModel filter = new JobFilterModel();

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    var result = await JobApi().getHotJobs(filter.parseToJobQuery(10, 0));
    setState(() => {this.relateJobData = result});
  }

  @override
  Widget build(BuildContext context) {
    filter = Provider.of<JobFilterModel>(context);
    return (Wrap(children: [
      Text(
        "Dành cho bạn",
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
                            jobApplyStatus: job.isApplied,
                          ),
                        ),
                      );
                    },
                    child: index == 0
                        ? CompanyCard(
                            jobResponse: job,
                            cardType: CardType.first,
                          )
                        : CompanyCard(
                            jobResponse: job, cardType: CardType.rest),
                  );
                },
              )
            : JobLoadingSkeleton(),
      )
    ]));
  }
}
