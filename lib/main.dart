import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Import provider
import 'welcome_page.dart';
import 'login_page.dart';
import 'register_page.dart';
import 'sign_in_page.dart';
import 'product_page.dart';
import 'buy_item_page.dart';
import 'cart_page.dart';
import 'thank_you_page.dart';
import 'profile_page.dart';
import 'theme_provider.dart'; // Import the ThemeProvider

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'V&S Online Shopping',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        brightness: themeProvider.isDarkMode ? Brightness.dark : Brightness.light,
        // You can customize your light and dark themes here
        // e.g., darkTheme: ThemeData.dark() for a default dark theme
        // Add any additional theme customization here
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => WelcomePage(),
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/signin': (context) => SignInPage(),
        '/products': (context) => ProductPage(),
        '/buy': (context) => BuyItemPage(itemIndex: 0),
        '/cart': (context) => CartPage(),
        '/thankyou': (context) => ThankYouPage(),
        '/profile': (context) => ProfilePage(),
      },
    );
  }
}
