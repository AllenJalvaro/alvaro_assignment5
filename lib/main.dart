import 'package:alvaro_assignment5/screens/category_list.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(PinoyRecipeApp());
}

class PinoyRecipeApp extends StatelessWidget {
  const PinoyRecipeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CategoryListScreen(),
    );
  }
}
