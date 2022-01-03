import 'package:flutter/material.dart';
import 'package:job/constants.dart';
import 'package:job/models/job_filter_model.dart';
import 'package:job/models/user.dart';
import 'package:job/services/api/user_api.dart';
import 'package:job/views/findStaff/staffLoadingSkeleton.dart';
import 'package:job/views/findStaff/staff_card.dart';
import 'package:job/views/findStaff/staff_detail.dart';
import 'package:provider/provider.dart';

class RecommendStaff extends StatefulWidget {
  RecommendStaff({Key? key}) : super(key: key);

  @override
  _RecommendStaffState createState() => _RecommendStaffState();
}

class _RecommendStaffState extends State<RecommendStaff> {
  var recommendStaffList = [];
  JobFilterModel filter = new JobFilterModel();

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    print("object user");
    // print(filter.getJobTo().toString());
    var result =
        await UserApi().getRecommendStaff(filter.parseToJobQuery(10, 0));
    print("user ${result}");
    setState(() => {this.recommendStaffList = result});
  }

  @override
  Widget build(BuildContext context) {
    filter = Provider.of<JobFilterModel>(context);
    return (Wrap(children: [
      Text(
        "Nhân diên zip bruh",
        style: kTitleStyle,
      ),
      SizedBox(height: 15.0),
      Container(
        width: double.infinity,
        height: 200.0,
        child: recommendStaffList.length != 0
            ? ListView.builder(
                itemCount: recommendStaffList.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  UserModel staff = recommendStaffList[index];
                  return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => StaffDetail(
                              staff: staff,
                            ),
                          ),
                        );
                      },
                      child: StaffCard(
                        staff: staff,
                      ));
                },
              )
            : StaffLoadingSkeleton(),
      )
    ]));
  }
}
