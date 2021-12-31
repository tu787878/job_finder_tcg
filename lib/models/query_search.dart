class QuerySearch {
  final int? page;
  final int? count;

  QuerySearch({
    this.page,
    this.count,
  });

  String toQuery() {
    return "?page=" + this.page.toString() + "&count=" + this.count.toString();
  }
}

QuerySearch queryNewJobsBasic = new QuerySearch(page: 0, count: 10);

class Jobquery extends QuerySearch {
  late final String? area;
  late final String? cityId;
  late final String? jobCategoryId;
  late final double? jobSalaryFrom;
  late final double? jobSalaryTo;
  late final String? orderBy;
  late final String? orderType;
  late final double? postCode;
  late final String? search;
  late final String? tags;

  Jobquery({
    page,
    count,
    this.area,
    this.cityId,
    this.jobCategoryId,
    this.jobSalaryFrom,
    this.jobSalaryTo,
    this.orderBy,
    this.orderType,
    this.postCode,
    this.search,
    this.tags,
  }) : super(page: page, count: count);

  String parseToParam() {
    return "${toQuery()}&area=${area}&cityId=${cityId}&jobCategoryId=${jobCategoryId}&jobSalaryFrom=${jobSalaryFrom}&jobSalaryTo=${jobSalaryTo}&orderBy=${orderBy}&orderType=${orderType}&postCode=${postCode}&search=${search}&tags=${tags}";
  }
}

Jobquery jobQueryBasic = new Jobquery(page: 0, count: 10);
