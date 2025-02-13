import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:storeapp/screens/home_page.dart';
import 'package:storeapp/screens/update_product.dart';


void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomePage.id : (context) => HomePage(),
        UpdateProduct.id:(context)=>UpdateProduct(),
      },
      initialRoute: HomePage.id,
    );
  }
}