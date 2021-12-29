import 'package:flutter/material.dart';
import 'package:job/constants.dart';
import 'package:job/models/query_search.dart';
import 'package:job/services/api/job_api.dart';
import 'package:job/views/findJob/jobLoadingSkeleton.dart';
import 'package:job/views/findJob/job_detail.dart';
import 'package:job/widgets/company_card2.dart';

class NewJob extends StatefulWidget {
  const NewJob({Key? key, this.filter}) : super(key: key);
  final filter;

  @override
  _NewJobState createState() => _NewJobState();
}

class _NewJobState extends State<NewJob> {
  var newJobData = [];

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    var result = await JobApi().getNewJobs(queryNewJobsBasic);
    setState(() => {this.newJobData = result});
  }

  @override
  Widget build(BuildContext context) {
    return (Wrap(
      children: [
        Text(
          "Mới",
          style: kTitleStyle,
        ),
        SizedBox(height: 15.0),
        newJobData.length != 0
            ? ListView.builder(
                itemCount: newJobData.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  var job = newJobData[index];
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
                      child: CompanyCard2(jobResponse: job));
                },
              )
            : JobLoadingSkeleton(
                // width: MediaQuery.of(context).size.width * 0.9,
                direction: DirectionType.column,
              )
      ],
    ));
  }
}
