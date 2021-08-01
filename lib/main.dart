import 'package:flutter/material.dart';
import 'package:mastore_app/pages/detail_chat_page.dart';
import 'package:mastore_app/pages/home/main_page.dart';
import 'package:mastore_app/pages/sign_in_page.dart';
import 'package:mastore_app/pages/sign_up_page.dart';
import 'package:mastore_app/pages/splash_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      routes: {
        '/': (context) => SplashPage(),
        '/sign-in': (context) => SignInPage(),
        '/sign-up': (context) => SignUpPage(),
        '/home': (context) => MainPage(),
        '/detail-chat': (context) => DetailChatPage(),
      },
    );
  }
}

// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Text(
//           'Hallo Everybadeeeh!',
//           style: priceTextStyle.copyWith(fontSize: 30),
//         ),
//       ),
//     );
//   }
// }
