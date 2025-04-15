import 'package:flutter/material.dart';
import 'package:fitness/models/category_model.dart';
import 'package:fitness/pages/category_detail_page.dart';

final List<CategoryModel> lunchDishes = [
  CategoryModel(
    name: 'Grilled Chicken',
    image: 'assets/images/grilled_chicken.jpg',
    color: const Color(0xFFE0F2F1),
    calories: 500,
    ingredients: ['Chicken Breast', 'Spices', 'Olive Oil', 'Garlic'],
    description: 'Juicy grilled chicken seasoned to perfection, served with herbs.',
  ),
  CategoryModel(
    name: 'Caesar Salad',
    image: 'assets/images/caesar_salad.jpg',
    color: const Color(0xFFE8F5E9),
    calories: 300,
    ingredients: ['Lettuce', 'Croutons', 'Parmesan', 'Caesar Dressing'],
    description: 'Crispy romaine tossed with cheese, croutons, and creamy dressing.',
  ),
  CategoryModel(
    name: 'Pasta Primavera',
    image: 'assets/images/pasta_primavera.jpg',
    color: const Color(0xFFF3E5F5),
    calories: 450,
    ingredients: ['Pasta', 'Bell Peppers', 'Zucchini', 'Tomatoes'],
    description: 'Colorful pasta dish loaded with seasonal vegetables.',
  ),
];

class LunchPage extends StatelessWidget {
  const LunchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildMealPage(context, 'Lunch', lunchDishes);
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
