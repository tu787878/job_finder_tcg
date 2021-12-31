import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:job/services/auth/Auth.dart';
import 'package:job/views/profiles/business/edit_profile.dart';

AppBar buildProfileAppBar(BuildContext context, String businessId) {
  final icon = CupertinoIcons.moon_stars;

  return AppBar(
    leading: BackButton(
      color: Colors.black,
    ),
    backgroundColor: Colors.transparent,
    elevation: 0,
    actions: [
      if (AuthService().isThisBusiness(businessId))
        Padding(
          padding: const EdgeInsets.all(14.0),
          child: GestureDetector(
            child: Text(
              "Edit",
              style: TextStyle(
                color: Colors.black,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Editprofile(),
              ),
            ),
          ),
        ),
    ],
  );
}
