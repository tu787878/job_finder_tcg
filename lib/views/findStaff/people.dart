import 'package:flutter/material.dart';
import 'package:job/constants.dart';
import 'package:job/models/job_filter_model.dart';
import 'package:job/views/findJob/findJob.dart';
import 'package:job/views/findJob/newJob.dart';
import 'package:job/views/findStaff/all_staff.dart';
import 'package:job/views/findStaff/recommend_staff.dart';
import 'package:job/widgets/appbar.dart';
import 'package:provider/provider.dart';

class FindStaff extends StatefulWidget {
  @override
  _FindStaffState createState() => _FindStaffState();
}

class _FindStaffState extends State<FindStaff> {
  final JobFilterModel filter = JobFilterModel();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: filter,
        ),
      ],
      builder: (context, child) {
        final something = context.watch<JobFilterModel>();
        return Scaffold(
          backgroundColor: kSilver,
          appBar: AppBarCustom(),
          body: Container(
            margin: EdgeInsets.only(left: 18.0),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 25.0),
                  FindJob(),
                  SizedBox(height: 25.0),
                  RecommendStaff(),
                  SizedBox(height: 25.0),
                  AllStaff(filter: filter)
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
