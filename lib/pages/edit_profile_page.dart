import 'package:flutter/material.dart';
import 'package:mastore_app/theme.dart';

class EditProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget header() {
      return AppBar();
    }

    Widget content() {
      return Container();
    }

    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar: header(),
      body: content(),
    );
  }
}
