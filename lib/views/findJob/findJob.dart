import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:job/constants.dart';
import 'package:job/models/job_filter_model.dart';
import 'package:job/views/findJob/filterForm.dart';

class FindJob extends StatefulWidget {
  const FindJob({Key? key, this.filter}) : super(key: key);
  final JobFilterModel? filter;

  @override
  _FindJobState createState() => _FindJobState();
}

class _FindJobState extends State<FindJob> {
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
                  child: MaterialButton(
                    child: Icon(
                      FontAwesomeIcons.slidersH,
                      color: Colors.white,
                      size: 20.0,
                    ),
                    onPressed: () => {
                      showModalBottomSheet<void>(
                        context: context,
                        enableDrag: false,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25.0),
                              topRight: Radius.circular(25.0)),
                        ),
                        builder: (BuildContext context) {
                          return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(25.0),
                                    topRight: Radius.circular(25.0)),
                                color: Colors.white,
                              ),
                              child: FilterForm(filter: widget.filter));
                        },
                      )
                    },
                  ))
            ],
          ),
        ),
      ],
    ));
  }
}
