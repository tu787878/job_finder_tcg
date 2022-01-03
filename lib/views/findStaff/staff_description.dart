import 'package:flutter/material.dart';
import 'package:job/constants.dart';
import 'package:job/models/user.dart';

class StaffDescriptionTab extends StatelessWidget {
  final UserModel? staff;
  StaffDescriptionTab({this.staff});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          SizedBox(height: 25.0),
          Text(
            "About the Opportunity",
            style: kTitleStyle.copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 15.0),
          Text(
            staff!.description,
            style: kSubtitleStyle.copyWith(
              fontWeight: FontWeight.w300,
              height: 1.5,
              color: Color(0xFF5B5B5B),
            ),
          ),
          SizedBox(height: 25.0),
          Text(
            "Job Responsbilities",
            style: kTitleStyle.copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 15.0),
          Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "•  ",
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 35.0),
                  ),
                  Expanded(
                    child: Text(
                      "${staff!.address}\n",
                      style: kSubtitleStyle.copyWith(
                        fontWeight: FontWeight.w300,
                        height: 1.5,
                        color: Color(0xFF5B5B5B),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
