import 'package:e_commerce/models/cart.dart';
import 'package:e_commerce/models/product_list.dart';
import 'package:e_commerce/pages/product_detail_page.dart';
import 'package:e_commerce/pages/products_overview_page.dart';
import 'package:e_commerce/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        
        ChangeNotifierProvider(
          create: (_)  => ProductList(),
        ),

        ChangeNotifierProvider(
          create: (_)  => Cart(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.purple,
          ).copyWith(
            secondary: Colors.deepOrange,
          ),
          appBarTheme: AppBarTheme(titleTextStyle: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
            centerTitle: true,
            backgroundColor: Colors.purple,
          ),
        fontFamily: 'Lato',
        ),
        home: ProductsOverviewPage(),
        routes: {
          AppRoutes.PRODUCT_DETAIL: (ctx) => ProductDetailPage(),
      
        },
      ),
    );
  }
}


