import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:job/models/applied_job_response.dart';
import 'package:job/models/query_search.dart';
import 'package:job/services/api/business_api.dart';
import 'package:job/views/findJob/jobLoadingSkeleton.dart';
import 'package:job/views/findJob/job_detail.dart';
import 'package:job/widgets/appbar.dart';

import 'widget/applied_job_card.dart';
import 'widget/business_job_card.dart';

class BusinessManager extends StatefulWidget {
  @override
  _ManagerState createState() => _ManagerState();
}

class _ManagerState extends State<BusinessManager> {
  int? groupValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(),
      body: Container(
        margin: EdgeInsets.only(left: 18.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(10),
                child: CupertinoSlidingSegmentedControl<int>(
                  backgroundColor: CupertinoColors.white,
                  thumbColor: CupertinoColors.activeGreen,
                  padding: EdgeInsets.all(8),
                  groupValue: groupValue,
                  children: {
                    0: buildSegment("Chờ"),
                    1: buildSegment("Hoàn tất"),
                  },
                  onValueChanged: (value) {
                    setState(() {
                      groupValue = value;
                    });
                  },
                ),
              ),
              FutureBuilder(
                future: BusinessApi().getAppliedJob(queryNewJobsBasic),
                builder: (context,
                    AsyncSnapshot<List<AppliedJobResponse>> snapshot) {
                  if (snapshot.hasData) {
                    var tuples = snapshot.data;
                    List<AppliedJobResponse> jobs;
                    if (groupValue == 0) {
                      jobs = [];
                      for (AppliedJobResponse job in tuples!) {
                        if (job.status != "accepted" &&
                            job.status != "refused") {
                          jobs.add(job);
                        }
                      }
                    } else {
                      jobs = [];
                      for (AppliedJobResponse job in tuples!) {
                        if (job.status == "accepted" ||
                            job.status == "refused") {
                          jobs.add(job);
                        }
                      }
                    }
                    return Container(
                      child: ListView.builder(
                        itemCount: jobs.length,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          var job = jobs[index];
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
                            child:
                                BusinessAppliedJobCard(appliedJobResponse: job),
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
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildSegment(String text) {
  return Container(
    child: Text(
      text,
      style: TextStyle(fontSize: 22, color: Colors.black),
    ),
  );
}
