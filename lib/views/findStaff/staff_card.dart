import 'package:flutter/material.dart';
import 'package:job/constants.dart';
import 'package:job/models/user.dart';

class StaffCard extends StatefulWidget {
  final UserModel staff;
  final cardType;
  const StaffCard({Key? key, required this.staff, this.cardType})
      : super(key: key);

  @override
  _StaffCardState createState() => _StaffCardState();
}

class _StaffCardState extends State<StaffCard> {
  @override
  Widget build(BuildContext context) {
    UserModel staff = widget.staff;
    return Container(
      width: (MediaQuery.of(context).size.width - 50) * 0.5,
      height: 200.0,
      margin: EdgeInsets.only(right: 15.0, bottom: 15.0),
      padding: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 70.0,
                height: 70.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  image: DecorationImage(
                    image: NetworkImage(staff.avatar != ""
                        ? staff.avatar
                        : "https://w7.pngwing.com/pngs/141/425/png-transparent-user-profile-computer-icons-avatar-profile-s-free-angle-rectangle-profile-cliparts-free-thumbnail.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 15.0),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child: Text(
                "${staff.firstName} ${staff.lastName}",
                textAlign: TextAlign.center,
                style: kTitleStyle.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              )),
            ],
          ),
          SizedBox(height: 15.0),
          // Expanded(
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     crossAxisAlignment: CrossAxisAlignment.end,
          //     children: [
          //       Row(
          //         mainAxisAlignment: MainAxisAlignment.start,
          //         children: staff.jobCategories
          //             .map(
          //               (e) => Container(
          //                 height: 35,
          //                 alignment: Alignment.center,
          //                 margin: EdgeInsets.only(right: 10.0),
          //                 padding: EdgeInsets.symmetric(
          //                     horizontal: 12.0, vertical: 5.0),
          //                 decoration: BoxDecoration(
          //                   borderRadius: BorderRadius.circular(12.0),
          //                   color: Colors.grey[200],
          //                 ),
          //                 child: Text(
          //                   e.name,
          //                   style: kSubtitleStyle.copyWith(
          //                     color: Colors.black,
          //                     fontSize: 12.0,
          //                   ),
          //                 ),
          //               ),
          //             )
          //             .toList(),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
