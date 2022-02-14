import 'package:cinemapp/models%20&%20providers/order.dart';
import 'package:cinemapp/screens/auth/auth_stream.dart';
import 'package:cinemapp/screens/auth/login_screen.dart';
import 'package:cinemapp/screens/auth/reset_password_screen.dart';
import 'package:cinemapp/screens/auth/signup_screen.dart';
import 'package:cinemapp/screens/inner_screens/categories_feed_screen.dart';
import 'package:cinemapp/screens/inner_screens/upload_product_screen.dart';
import 'package:cinemapp/screens/landing_screen.dart';
import 'package:cinemapp/screens/main_screen.dart';
import 'package:cinemapp/screens/orders/orders_screen.dart';
import 'package:cinemapp/screens1/booking/components/pay_button.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cinemapp/screens/bottom_nav_screen.dart';
import 'package:cinemapp/screens/cart/cart_screen.dart';
import 'package:cinemapp/screens/feeds_screen.dart';
import 'package:cinemapp/screens/home_screen.dart';
import 'package:cinemapp/screens/inner_screens/product_details_screen.dart';
import 'package:cinemapp/screens/search_screen.dart';
import 'package:cinemapp/screens/user_scren.dart';
import 'package:cinemapp/screens/wishlist/wishlist_screen.dart';
import 'package:provider/provider.dart';
import 'package:cinemapp/screens1/Ticket_screen.dart';

import 'models & providers/cart.dart';
import 'models & providers/my_theme.dart';
import 'models & providers/product.dart';
import 'models & providers/wishlist.dart';
import 'package:universal_io/io.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => ThemeNotifier()),
        ChangeNotifierProvider(create: (ctx) => ProductProvider()),
        ChangeNotifierProvider(create: (ctx) => CartProvider()),
        ChangeNotifierProvider(create: (ctx) => WishlistProvider()),
        ChangeNotifierProvider(create: (ctx) => OrderProvider()),
      ],
      child: Consumer<ThemeNotifier>(builder: (context, notifier, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: MyAppTheme.myThemes(notifier.isDark, context),
          home: const AuthStateScreen(),
          routes: {
            BottomNavScreen.routeName: (ctx) => const BottomNavScreen(),
            HomeScreen.routeName: (ctx) => const HomeScreen(),
            FeedsScreen.routeName: (ctx) => FeedsScreen(),
            SearchScreen.routeName: (ctx) => SearchScreen(),
            CartScreen.routeName: (ctx) => const CartScreen(),
            UserScreen.routeName: (ctx) => const UserScreen(),
            WishlistScreen.routeName: (ctx) => const WishlistScreen(),
            ProductDetailsScreen.routeName: (ctx) =>
                const ProductDetailsScreen(),
            TicketScreen.routeName: (ctx) => const TicketScreen(),
            CategoriesFeedScreen.routeName: (ctx) =>
                const CategoriesFeedScreen(),
            LandingScreen.routeName: (ctx) => const LandingScreen(),
            LoginScreen.routeName: (ctx) => LoginScreen(),
            SignupScreen.routeName: (ctx) => SignupScreen(),
            UploadProductScreen.routeName: (ctx) => UploadProductScreen(),
            ResetPasswordScreen.routeName: (ctx) => ResetPasswordScreen(),
            OrderScreen.routeName: (ctx) => const OrderScreen(),
          },
        );
      }),
    );
  }
}
