import 'package:flutter/material.dart';
import 'package:job/constants.dart';
import 'package:job/models/JobResponse.dart';
import 'package:job/models/job_model.dart';

class StaffCard extends StatefulWidget {
  final JobResponse jobResponse;
  final cardType;
  const StaffCard({Key? key, required this.jobResponse, this.cardType})
      : super(key: key);

  @override
  _StaffCardState createState() => _StaffCardState();
}

class _StaffCardState extends State<StaffCard> {
  @override
  Widget build(BuildContext context) {
    JobModel job = widget.jobResponse.job;
    return Container(
      width: (MediaQuery.of(context).size.width - 60) * 0.5,
      height: 300.0,
      margin: EdgeInsets.only(right: 15.0, bottom: 15.0),
      padding: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  image: DecorationImage(
                    image: NetworkImage(job.business.businessLogoPath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    job.salaryFrom.toString() +
                        "€/h - " +
                        job.salaryTo.toString() +
                        "€/h",
                    style: kTitleStyle.copyWith(color: Colors.black),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: job.business.businessName,
                          style: kSubtitleStyle,
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(height: 15.0),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: Text(
                job.jobName,
                style: kTitleStyle.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              )),
              Text(
                widget.jobResponse.subscribers.toString() + " đăng kí",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ],
          ),
          SizedBox(height: 15.0),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: job.jobTags
                      .map(
                        (e) => Container(
                          height: 35,
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(right: 10.0),
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 5.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            color: Colors.grey[200],
                          ),
                          child: Text(
                            e.name,
                            style: kSubtitleStyle.copyWith(
                              color: Colors.black,
                              fontSize: 12.0,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
                if (widget.jobResponse.isApplied)
                  Container(
                    height: 35,
                    child: Text(
                      "Đã đăng kí",
                      style: kSubtitleStyle.copyWith(
                        color: Colors.black,
                        fontSize: 12.0,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
