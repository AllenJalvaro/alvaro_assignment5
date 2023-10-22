import 'package:alvaro_assignment5/models/category.dart';
import 'package:alvaro_assignment5/screens/recipe_list.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CategoryTile extends StatelessWidget {
  CategoryTile({super.key, required this.category});

  Category category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(category.name);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => RecipeListScreen(
              category: category,
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            category.color,
            category.color.withOpacity(0.65),
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            category.name,
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w300,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
