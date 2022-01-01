import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:job/models/applied_job_response.dart';
import 'package:job/models/query_search.dart';
import 'package:job/services/api/business_api.dart';
import 'package:job/services/auth/Auth.dart';
import 'package:job/views/findJob/jobLoadingSkeleton.dart';
import 'package:job/views/findJob/job_detail.dart';
import 'package:job/views/manager/business_manager.dart';
import 'package:job/views/manager/user_manager.dart';
import 'package:job/widgets/appbar.dart';

import 'widget/applied_job_card.dart';
import 'widget/business_job_card.dart';

class TabManager extends StatefulWidget {
  @override
  _ManagerState createState() => _ManagerState();
}

class _ManagerState extends State<TabManager> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(),
      body: AuthService().isBusiness() ? BusinessManager() : UserManager(),
    );
  }
}
