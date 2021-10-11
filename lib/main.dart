import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mastore_app/pages/checkout_page.dart';
import 'package:mastore_app/pages/checkout_succes.dart';
import 'package:mastore_app/pages/edit_profile_page.dart';
import 'package:mastore_app/pages/home/cart_page.dart';
import 'package:mastore_app/pages/home/main_page.dart';
import 'package:mastore_app/pages/sign_in_page.dart';
import 'package:mastore_app/pages/sign_up_page.dart';
import 'package:mastore_app/pages/splash_page.dart';
import 'package:mastore_app/provider/auth_provider.dart';
import 'package:mastore_app/provider/cart_provider.dart';
import 'package:mastore_app/provider/page_provider.dart';
import 'package:mastore_app/provider/product_provider.dart';
import 'package:mastore_app/provider/transaction_provider.dart';
import 'package:mastore_app/provider/whislist_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => WhislistProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => TransactionProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PageProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        routes: {
          '/': (context) => SplashPage(),
          '/sign-in': (context) => SignInPage(),
          '/sign-up': (context) => SignUpPage(),
          '/home': (context) => MainPage(),
          '/edit-profile': (context) => EditProfilePage(),
          '/cart': (context) => CartPage(),
          '/checkout': (context) => CheckoutPage(),
          '/checkout-success': (context) => CheckoutSuccess(),
        },
      ),
    );
  }
}
