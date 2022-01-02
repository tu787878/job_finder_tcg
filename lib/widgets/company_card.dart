import 'package:flutter/material.dart';
import 'package:job/constants.dart';
import 'package:job/models/JobResponse.dart';
import 'package:job/models/job_model.dart';

enum CardType { first, rest }

class CompanyCard extends StatefulWidget {
  final JobResponse jobResponse;
  final cardType;
  const CompanyCard({Key? key, required this.jobResponse, this.cardType})
      : super(key: key);

  @override
  _CompanyCardState createState() => _CompanyCardState();
}

class _CompanyCardState extends State<CompanyCard> {
  @override
  Widget build(BuildContext context) {
    JobModel job = widget.jobResponse.job;
    bool isFirstCard = widget.cardType == CardType.first;
    return Container(
      width: 300.0,
      height: 200.0,
      margin: EdgeInsets.only(right: 15.0, bottom: 15.0),
      padding: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: isFirstCard ? kBlack : Colors.white,
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
                    style: kTitleStyle.copyWith(
                        color: isFirstCard ? Colors.white : Colors.black),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: job.business.businessName,
                          style: isFirstCard
                              ? kSubtitleStyle.copyWith(
                                  color: Colors.white,
                                )
                              : kSubtitleStyle,
                        ),
                        // TextSpan(
                        //   text: "  •  ",
                        //   style: isFirstCard
                        //       ? kSubtitleStyle.copyWith(
                        //           color: Colors.white,
                        //         )
                        //       : kSubtitleStyle,
                        // ),
                        // TextSpan(
                        //   text: job.business.businessCategory.name,
                        //   style: isFirstCard
                        //       ? kSubtitleStyle.copyWith(
                        //           color: Colors.white,
                        //         )
                        //       : kSubtitleStyle,
                        // ),
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
                  color: isFirstCard ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              )),
              Text(
                widget.jobResponse.subscribers.toString() + " đăng kí",
                style: TextStyle(
                  color: isFirstCard ? Colors.white : Colors.black,
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
                            color:
                                isFirstCard ? kBlackAccent : Colors.grey[200],
                          ),
                          child: Text(
                            e.name,
                            style: kSubtitleStyle.copyWith(
                              color: isFirstCard ? Colors.white : Colors.black,
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
                        color: isFirstCard ? Colors.white : Colors.black,
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

// class CompanyCard extends StatefulWidget {
  
//   CompanyCard({required this.jobResponse});
//   @override
  
// }
