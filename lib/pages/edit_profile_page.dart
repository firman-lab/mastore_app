import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mastore_app/theme.dart';

class EditProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget header() {
      return AppBar(
        backgroundColor: backgroundColor3,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.close,
          ),
        ),
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Edit Profile',
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.check,
              color: primaryColor,
            ),
          ),
        ],
      );
    }

    Widget namaInput() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name',
              style: primaryTextStyle.copyWith(
                fontSize: 13,
                fontWeight: regular,
              ),
            ),
            TextFormField(
              style: primaryTextStyle,
              decoration: InputDecoration(
                hintText: 'Firman Hidiyit',
                hintStyle: primaryTextStyle.copyWith(
                  fontWeight: medium,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: subtitleTextColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget usernameInput() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Username',
              style: primaryTextStyle.copyWith(
                fontSize: 13,
                fontWeight: regular,
              ),
            ),
            TextFormField(
              style: primaryTextStyle,
              decoration: InputDecoration(
                hintText: '@opeel',
                hintStyle: primaryTextStyle.copyWith(
                  fontWeight: medium,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: subtitleTextColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget emailInput() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Email',
              style: primaryTextStyle.copyWith(
                fontSize: 13,
                fontWeight: regular,
              ),
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              style: primaryTextStyle,
              decoration: InputDecoration(
                hintText: 'firminhid@gmail.com',
                hintStyle: primaryTextStyle.copyWith(
                  fontWeight: medium,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: subtitleTextColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget content() {
      return Container(
        padding: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              margin: EdgeInsets.only(
                top: defaultMargin,
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/pp.png'),
                ),
              ),
            ),
            namaInput(),
            usernameInput(),
            emailInput(),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar: header(),
      body: content(),
      resizeToAvoidBottomInset: false,
    );
  }
}
