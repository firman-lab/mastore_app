import 'package:flutter/material.dart';
import 'package:mastore_app/theme.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        child: AppBar(
          backgroundColor: backgroundColor3,
          automaticallyImplyLeading: false,
          flexibleSpace: SafeArea(
            child: Container(
              padding: EdgeInsets.all(
                defaultMargin,
              ),
              child: Row(
                children: [
                  ClipOval(
                    child: Image.asset(
                      'assets/pp.png',
                      width: 64,
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Firman Hids',
                          style: primaryTextStyle.copyWith(
                            fontSize: 24,
                            fontWeight: semiBold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          '@upil',
                          style: subtitleTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: medium,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/sign-in', (route) => false);
                    },
                    child: Image.asset(
                      'assets/pp.png',
                      width: 28,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }

    Widget menuItem(String text) {
      return Container(
        margin: EdgeInsets.only(
          top: 16,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: secondaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: regular,
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: secondaryTextColor,
            )
          ],
        ),
      );
    }

    Widget content() {
      return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: backgroundColor3,
        ),
        margin: EdgeInsets.all(
          defaultMargin,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Account',
              style: primaryTextStyle.copyWith(
                fontSize: 22,
                fontWeight: medium,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/edit-profile');
              },
              child: menuItem(
                'Edit profile',
              ),
            ),
            menuItem(
              'Your orders',
            ),
            menuItem(
              'Help',
            ),
            SizedBox(
              height: 32,
            ),
            Text(
              'General',
              style: primaryTextStyle.copyWith(
                fontSize: 22,
                fontWeight: medium,
              ),
            ),
            menuItem(
              'Privacy & Policy',
            ),
            menuItem(
              'Term of service',
            ),
            menuItem(
              'Rate App',
            ),
          ],
        ),
      );
    }

    return Column(
      children: [
        header(),
        content(),
      ],
    );
  }
}
