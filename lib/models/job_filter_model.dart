class JobFilterModel {
  late double _count;
  late String _page;
  late double _area;
  late String _cityId;
  late double _jobSalaryFrom;
  late double _jobSalaryTo;
  late String _jobCategoryId;
  late double _postCode;
  late String _search;
  late String _tags;

  JobFilterModel() {
    this._count = 0.0;
    this._page = "";
    this._area = 0.0;
    this._cityId = "";
    this._jobSalaryFrom = 0.0;
    this._jobSalaryTo = 0.0;
    this._jobCategoryId = "";
    this._postCode = 0.0;
    this._search = "";
    this._tags = "fulltime";
  }

  getCount() => this._count;
  setCount(double newCount) {
    this._count = newCount;
  }

  getPage() => this._page;
  setPage(String newPage) {
    this._page = newPage;
  }

  getArea() => this._area;
  setArea(double newArea) {
    this._area = newArea;
  }

  getCity() => this._cityId;
  setCity(String newCity) {
    this._cityId = newCity;
  }

  getJobFrom() => this._jobSalaryFrom;
  setJobFrom(double from) {
    this._jobSalaryFrom = from;
  }

  getJobTo() => this._jobSalaryTo;
  setJobTo(double to) {
    this._jobSalaryTo = to;
  }

  getJobCategory() => this._jobCategoryId;
  setJobCategory(String newCate) {
    this._cityId = newCate;
  }

  getPostCode() => this._postCode;
  setPostCode(double newPostCode) {
    this._postCode = newPostCode;
  }

  getSearch() => this._search;
  setSearch(String newSearch) {
    this._search = newSearch;
  }

  getTags() => this._tags;
  setTags(String newTags) {
    this._tags = newTags;
  }
}
