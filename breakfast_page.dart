import 'package:flutter/material.dart';
import 'package:fitness/models/category_model.dart';
import 'package:fitness/pages/category_detail_page.dart';

final List<CategoryModel> breakfastDishes = [
  CategoryModel(
    name: 'Pancakes',
    image: 'assets/images/pancakes.jpg',
    color: const Color(0xFFFFF3E0),
    calories: 350,
    ingredients: ['Flour', 'Milk', 'Eggs', 'Baking Powder', 'Butter', 'Syrup'],
    description: 'Fluffy pancakes served with syrup and butter. Great with fruits too.',
  ),
  CategoryModel(
    name: 'Waffles',
    image: 'assets/images/waffles.jpg',
    color: const Color(0xFFE1F5FE),
    calories: 400,
    ingredients: ['Flour', 'Milk', 'Eggs', 'Butter', 'Sugar'],
    description: 'Crispy waffles with deep pockets for syrup and berries. A breakfast classic.',
  ),
  CategoryModel(
    name: 'Omelette',
    image: 'assets/images/omelette.jpg',
    color: const Color(0xFFF1F8E9),
    calories: 250,
    ingredients: ['Eggs', 'Cheese', 'Onions', 'Peppers', 'Salt'],
    description: 'Protein-packed omelette with your favorite fillings and cheese.',
  ),
];

class BreakfastPage extends StatelessWidget {
  const BreakfastPage({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildMealPage(context, 'Breakfast', breakfastDishes);
  }

  Widget _buildMealPage(BuildContext context, String title, List<CategoryModel> dishes) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: dishes.length,
        itemBuilder: (context, index) {
          final dish = dishes[index];
          return GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => CategoryDetailPage(category: dish)),
            ),
            child: Container(
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: dish.color,
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListTile(
                leading: Image.asset(dish.image, height: 50, width: 50, fit: BoxFit.cover),
                title: Text(dish.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text('${dish.calories} calories'),
              ),
            ),
          );
        },
      ),
    );
  }
}
