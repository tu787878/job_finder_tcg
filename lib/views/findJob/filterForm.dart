import 'package:flutter/material.dart';
import 'package:job/models/job_filter_model.dart';

class FilterForm extends StatefulWidget {
  const FilterForm({Key? key, this.filter}) : super(key: key);
  final JobFilterModel? filter;

  @override
  _FilterFormState createState() => _FilterFormState();
}

class _FilterFormState extends State<FilterForm> {
  @override
  Widget build(BuildContext context) {
    JobFilterModel? filter = widget.filter;
    return Container(
        child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Column(children: [
              Text("filter"),
              Divider(),
              RangeSlider(
                  min: 0,
                  max: 100,
                  divisions: 20,
                  values: RangeValues(filter!.getJobFrom(), filter.getJobTo()),
                  labels: RangeLabels(
                    filter.getJobFrom().round().toString(),
                    filter.getJobTo().round().toString(),
                  ),
                  onChanged: (RangeValues newRange) {
                    setState(() {
                      filter.setJobFrom(newRange.start);
                      filter.setJobTo(newRange.end);
                    });
                  })
            ])));
  }
}
