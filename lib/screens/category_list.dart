import 'package:alvaro_assignment5/components/category_tile.dart';
import 'package:alvaro_assignment5/data/back_data.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CategoryListScreen extends StatelessWidget {
  CategoryListScreen({super.key});

  var categoryList = CATEGORIES;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pinoy Recipes'),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: GridView(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        children: categoryList.map((element) {
          return CategoryTile(
            category: element,
          );
        }).toList(),
      ),
    );
  }
}
