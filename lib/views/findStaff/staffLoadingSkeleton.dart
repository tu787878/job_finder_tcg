import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

enum DirectionType { row, column }

class StaffLoadingSkeleton extends StatelessWidget {
  final double width;
  final DirectionType direction;
  const StaffLoadingSkeleton(
      {Key? key, this.width = 200, this.direction = DirectionType.row})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: SizedBox(
          height: 250,
          child: ListView(
              scrollDirection: direction == DirectionType.row
                  ? Axis.horizontal
                  : Axis.vertical,
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              children: [
                Container(
                  width: (MediaQuery.of(context).size.width - 50) * 0.5,
                  height: 200,
                  margin: EdgeInsets.only(right: 15.0, bottom: 15.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Shimmer(
                    duration: Duration(seconds: 3),
                    interval: Duration(seconds: 0),
                    color: Colors.grey,
                    colorOpacity: 0.3,
                    enabled: true,
                    direction: ShimmerDirection.fromLTRB(),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        color: Colors.grey[200],
                      ),
                    ),
                  ),
                ),
                Container(
                  width: (MediaQuery.of(context).size.width - 50) * 0.5,
                  height: 190,
                  margin: EdgeInsets.only(right: 15.0, bottom: 15.0),
                  child: Shimmer(
                    duration: Duration(seconds: 3),
                    interval: Duration(seconds: 0),
                    color: Colors.grey,
                    colorOpacity: 0.3,
                    enabled: true,
                    direction: ShimmerDirection.fromLTRB(),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        color: Colors.grey[200],
                      ),
                    ),
                  ),
                ),
              ]),
        ));
  }
}
