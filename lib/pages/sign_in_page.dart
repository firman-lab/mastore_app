import 'package:flutter/material.dart';
import 'package:mastore_app/theme.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Login',
                style: primaryTextStyle.copyWith(
                    fontSize: 24, fontWeight: semiBold)),
            SizedBox(
              height: 2,
            ),
            Text(
              'Sign in to Continue',
              style:
                  subtitleTextStyle.copyWith(fontSize: 16, fontWeight: regular),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor1,
      body: Container(
        margin: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            header(),
          ],
        ),
      ),
    );
  }
}
