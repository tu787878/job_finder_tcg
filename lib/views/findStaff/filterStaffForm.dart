import 'package:flutter/material.dart';
import 'package:job/models/job_filter_model.dart';

class FilterStaffForm extends StatefulWidget {
  const FilterStaffForm({Key? key, this.filter}) : super(key: key);
  final JobFilterModel? filter;

  @override
  _FilterStaffFormState createState() => _FilterStaffFormState();
}

class _FilterStaffFormState extends State<FilterStaffForm> {
  late TextEditingController _distanceController;
  late TextEditingController _postalController;

  @override
  void initState() {
    super.initState();
    _distanceController = TextEditingController();
    _postalController = TextEditingController();
  }

  @override
  void dispose() {
    _distanceController.dispose();
    _postalController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    JobFilterModel? filter = widget.filter;
    return Container(
        child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Column(children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Row(children: [
                  Text(
                    "Filters",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Spacer(),
                ]),
              ),
              Divider(),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 12),
                child: Row(
                  children: <Widget>[
                    Text(
                      "Thu nhập",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    Spacer(),
                    Text(
                      "0€/h - 20€/h",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15),
                    )
                  ],
                ),
              ),
              RangeSlider(
                  min: 0.0,
                  max: 20.0,
                  divisions: 10,
                  values: RangeValues(filter!.getJobFrom(), filter.getJobTo()),
                  labels: RangeLabels(
                    filter.getJobFrom().round().toString() + "€/h",
                    filter.getJobTo().round().toString() + "€/h",
                  ),
                  onChanged: (RangeValues newRange) {
                    setState(() {
                      filter.setJobFrom(newRange.start);
                      filter.setJobTo(newRange.end);
                    });
                  }),
              SizedBox(
                height: 20,
              ),
              Text("Khoảng cách",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 15),
                  textAlign: TextAlign.left),
              Slider(
                  min: 0.0,
                  max: 20.0,
                  divisions: 10,
                  value: filter.getArea(),
                  label: filter.getArea().round().toString() + "km",
                  onChanged: (double newDistance) {
                    setState(() {
                      filter.setArea(newDistance);
                    });
                  }),
              SizedBox(
                height: 20,
              ),
              Text("Thành phố",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 15),
                  textAlign: TextAlign.left),
              DropdownButton<String>(
                value: filter.getCity(),
                icon: const Icon(Icons.arrow_downward),
                elevation: 16,
                style: const TextStyle(color: Colors.deepPurple),
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    setState(() {
                      filter.setCity(newValue);
                    });
                  }
                },
                items: <String>['', 'City1', 'City2', 'City3', 'City4']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              SizedBox(
                height: 15.0,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: ListTile(
                      title: const Text('Fulltime'),
                      leading: Radio<String>(
                        value: "fulltime",
                        groupValue: filter.getTags(),
                        onChanged: (String? value) {
                          if (value != null) {
                            setState(() {
                              filter.setTags(value);
                            });
                          }
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListTile(
                      title: const Text('Parttime'),
                      leading: Radio<String>(
                        value: "parttime",
                        groupValue: filter.getTags(),
                        onChanged: (String? value) {
                          if (value != null) {
                            setState(() {
                              filter.setTags(value);
                            });
                          }
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                ],
              )
            ])));
  }
}
