import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:job/constants.dart';

class FindJob extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (Column(
      children: [
        Text(
          "Tìm Công Việc",
          style: kPageTitleStyle,
        ),
        SizedBox(height: 25.0),
        Container(
          width: double.infinity,
          height: 50.0,
          margin: EdgeInsets.only(right: 18.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: TextField(
                    cursorColor: kBlack,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.search,
                        size: 25.0,
                        color: kBlack,
                      ),
                      border: InputBorder.none,
                      hintText: "Tìm kiếm",
                      hintStyle: kSubtitleStyle.copyWith(
                        color: Colors.black38,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: 50.0,
                height: 50.0,
                margin: EdgeInsets.only(left: 12.0),
                decoration: BoxDecoration(
                  color: kBlack,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Icon(
                  FontAwesomeIcons.slidersH,
                  color: Colors.white,
                  size: 20.0,
                ),
              )
            ],
          ),
        ),
      ],
    ));
  }
}
