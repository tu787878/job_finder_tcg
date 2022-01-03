import 'package:flutter/material.dart';
import 'package:job/constants.dart';

class StaffHistory extends StatelessWidget {
  StaffHistory();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          SizedBox(height: 25.0),
          Text(
            "Staff working history",
            style: kTitleStyle.copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 15.0),
          Text(
            "history",
            style: kSubtitleStyle.copyWith(
              fontWeight: FontWeight.w300,
              height: 1.5,
              color: Color(0xFF5B5B5B),
            ),
          ),
        ],
      ),
    );
  }
}
