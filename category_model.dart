import 'package:flutter/material.dart';

class CategoryModel {
  final String name;
  final String image;
  final Color color;
  final int calories;
  final List<String> ingredients;
  final String description;

  CategoryModel({
    required this.name,
    required this.image,
    required this.color,
    required this.calories,
    required this.ingredients,
    required this.description,
  });
}

