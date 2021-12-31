import 'package:flutter/material.dart';
import 'package:job/models/query_search.dart';

class JobFilterModel extends ChangeNotifier {
  late double _area;
  late String _cityId;
  late double _jobSalaryFrom;
  late double _jobSalaryTo;
  late String _jobCategoryId;
  late double _postCode;
  late String _search;
  late String _tags;

  JobFilterModel() {
    this._area = 0.0;
    this._cityId = "";
    this._jobSalaryFrom = 0.0;
    this._jobSalaryTo = 0.0;
    this._jobCategoryId = "";
    this._postCode = 0.0;
    this._search = "";
    this._tags = "fulltime";
  }

  Jobquery parseToJobQuery(int count, int page) {
    return new Jobquery(
      count: count,
      page: page,
      area: this._area.toString(),
      cityId: this._cityId,
      jobSalaryFrom: this._jobSalaryFrom,
      jobSalaryTo: this._jobSalaryTo,
      jobCategoryId: this._jobCategoryId,
      search: this._search,
    );
  }

  getArea() => this._area;
  setArea(double newArea) {
    this._area = newArea;
    notifyListeners();
  }

  getCity() => this._cityId;
  setCity(String newCity) {
    this._cityId = newCity;
    notifyListeners();
  }

  getJobFrom() => this._jobSalaryFrom;
  setJobFrom(double from) {
    this._jobSalaryFrom = from;
    notifyListeners();
  }

  getJobTo() => this._jobSalaryTo;
  setJobTo(double to) {
    this._jobSalaryTo = to;
    notifyListeners();
  }

  getJobCategory() => this._jobCategoryId;
  setJobCategory(String newCate) {
    this._cityId = newCate;
    notifyListeners();
  }

  getPostCode() => this._postCode;
  setPostCode(double newPostCode) {
    this._postCode = newPostCode;
    notifyListeners();
  }

  getSearch() => this._search;
  setSearch(String newSearch) {
    this._search = newSearch;
    notifyListeners();
  }

  getTags() => this._tags;
  setTags(String newTags) {
    this._tags = newTags;
    notifyListeners();
  }
}
