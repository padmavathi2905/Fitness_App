import 'package:flutter/material.dart';
import 'package:fitness/models/category_model.dart';
import 'package:fitness/pages/category_detail_page.dart';

final List<CategoryModel> dinnerDishes = [
  CategoryModel(
    name: 'Steak with Veggies',
    image: 'assets/images/steak_veggies.jpg',
    color: const Color(0xFFFFE0B2),
    calories: 600,
    ingredients: ['Beef Steak', 'Broccoli', 'Carrots', 'Butter'],
    description: 'A hearty grilled steak served with sautéed fresh vegetables.',
  ),
  CategoryModel(
    name: 'Stir Fry Noodles',
    image: 'assets/images/stir_fry.jpg',
    color: const Color(0xFFD1C4E9),
    calories: 480,
    ingredients: ['Noodles', 'Soy Sauce', 'Chicken', 'Vegetables'],
    description: 'Savory noodle stir-fry with chicken and colorful veggies.',
  ),
  CategoryModel(
    name: 'Lentil Soup',
    image: 'assets/images/lentil_soup.jpg',
    color: const Color(0xFFC8E6C9),
    calories: 350,
    ingredients: ['Lentils', 'Carrots', 'Celery', 'Onions'],
    description: 'Warm, comforting soup made with lentils and seasonal vegetables.',
  ),
];

class DinnerPage extends StatelessWidget {
  const DinnerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildMealPage(context, 'Dinner', dinnerDishes);
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
