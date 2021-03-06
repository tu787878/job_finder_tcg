import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:job/services/auth/Auth.dart';
import 'package:job/views/profiles/business/profile_page.dart';
import 'package:job/views/profiles/user/profile_page.dart';

import '../constants.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  const AppBarCustom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: kSilver,
      elevation: 0.0,
      leading: Padding(
        padding: const EdgeInsets.only(
          left: 18.0,
          top: 12.0,
          bottom: 12.0,
          right: 12.0,
        ),
        child: SvgPicture.asset(
          "assets/drawer.svg",
          color: kBlack,
        ),
      ),
      actions: <Widget>[
        GestureDetector(
          child: SvgPicture.asset(
            "assets/user.svg",
            width: 25.0,
            color: kBlack,
          ),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AuthService().isBusiness()
                  ? BusinessProfilePage()
                  : UserProfilePage(),
            ),
          ),
        ),
        SizedBox(width: 18.0)
      ],
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(AppBar().preferredSize.height);
}
