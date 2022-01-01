import 'package:flutter/material.dart';
import 'package:job/constants.dart';
import 'package:job/models/job_model.dart';

class JobMiniCard extends StatelessWidget {
  final JobModel? job;

  JobMiniCard({this.job});
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      margin: EdgeInsets.only(right: 18.0, top: 15.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: ListTile(
        leading: Container(
          width: 50.0,
          height: 50.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            image: DecorationImage(
              image: NetworkImage(job!.business.businessLogoPath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: Text(job!.jobName, style: kTitleStyle),
        subtitle: Text(
          "${job!.city.name} • 3 ngày trước",
        ),
        trailing: Icon(
          Icons.more_vert,
          color: kBlack,
        ),
      ),
    );
  }
}
