import 'package:flutter/material.dart';
import 'package:job/constants.dart';
import 'package:job/models/user.dart';
import 'package:job/views/findJob/description_tab.dart';
import 'package:job/views/findStaff/staff_description.dart';
import 'package:job/views/findStaff/staff_history.dart';

class StaffDetail extends StatefulWidget {
  final UserModel staff;
  const StaffDetail({Key? key, required this.staff}) : super(key: key);

  @override
  _StaffDetailState createState() => _StaffDetailState();
}

class _StaffDetailState extends State<StaffDetail> {
  @override
  Widget build(BuildContext context) {
    UserModel staff = widget.staff;
    return Scaffold(
      backgroundColor: kSilver,
      appBar: AppBar(
        backgroundColor: kSilver,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: kBlack,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "${staff.firstName} ${staff.lastName}",
          style: kTitleStyle,
        ),
        centerTitle: true,
      ),
      body: DefaultTabController(
        length: 2,
        child: Container(
          width: double.infinity,
          // margin: EdgeInsets.only(top: 50.0),
          padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 15.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.0),
              topRight: Radius.circular(40.0),
            ),
          ),
          child: Column(
            children: <Widget>[
              Container(
                constraints: BoxConstraints(maxHeight: 260.0),
                child: Column(
                  children: <Widget>[
                    Center(
                      child: Container(
                        width: 80.0,
                        height: 80.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          image: DecorationImage(
                            image: NetworkImage(staff.avatar != ""
                                ? staff.avatar
                                : "https://w7.pngwing.com/pngs/141/425/png-transparent-user-profile-computer-icons-avatar-profile-s-free-angle-rectangle-profile-cliparts-free-thumbnail.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      staff.firstName,
                      style: kTitleStyle.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 15.0),
                    SizedBox(height: 15.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: staff.jobCategories
                          .map(
                            (e) => Container(
                              margin: EdgeInsets.symmetric(horizontal: 5.0),
                              padding: EdgeInsets.symmetric(
                                horizontal: 8.0,
                                vertical: 5.0,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                border:
                                    Border.all(color: kBlack.withOpacity(.5)),
                              ),
                              child: Text(
                                e.name,
                                style: kSubtitleStyle,
                              ),
                            ),
                          )
                          .toList(),
                    ),
                    SizedBox(height: 25.0),
                    Material(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        side: BorderSide(
                          color: kBlack.withOpacity(.2),
                        ),
                      ),
                      // borderRadius: BorderRadius.circular(12.0),
                      child: TabBar(
                        unselectedLabelColor: kBlack,
                        indicator: BoxDecoration(
                          color: kOrange,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        tabs: [
                          Tab(text: "Description"),
                          Tab(text: "History"),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 10.0),
              Expanded(
                child: TabBarView(
                  children: [
                    StaffDescriptionTab(staff: staff),
                    StaffHistory(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: Container(
          padding: EdgeInsets.only(left: 18.0, bottom: 25.0, right: 18.0),
          // margin: EdgeInsets.only(bottom: 25.0),
          color: Colors.white,
          child: Row(
            children: <Widget>[
              // Container(
              //   width: 50.0,
              //   height: 50.0,
              //   decoration: BoxDecoration(
              //     border: Border.all(color: kBlack.withOpacity(.5)),
              //     borderRadius: BorderRadius.circular(12.0),
              //   ),
              //   child: Icon(
              //     Icons.bookmark_border,
              //     color: kBlack,
              //   ),
              // ),
              SizedBox(width: 15.0),
              // Expanded(
              //   child: SizedBox(
              //     height: 50.0,
              //     child: ElevatedButton(
              //       onPressed: () {},
              //       style: ElevatedButton.styleFrom(
              //         primary: kBlack,
              //         shape: RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(12.0),
              //         ),
              //       ),
              //       child: Text(
              //         !jobApplyStatus! ? "Apply for Job" : "Cancel",
              //         style: kTitleStyle.copyWith(
              //           color: Colors.white,
              //         ),
              //       ),
              //     ),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
