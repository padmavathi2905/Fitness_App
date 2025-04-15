import 'package:flutter/material.dart';
import 'package:fitness/models/category_model.dart';
import 'package:fitness/pages/breakfast_page.dart' show BreakfastPage, breakfastDishes;
import 'package:fitness/pages/lunch_page.dart' show LunchPage, lunchDishes;
import 'package:fitness/pages/dinner_page.dart' show DinnerPage, dinnerDishes;
import 'package:fitness/pages/category_detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();
  List<_MealCategory> filteredCategories = [];

  final List<_MealCategory> _allCategories = [
    _MealCategory(
      title: 'Breakfast',
      image: 'assets/images/pancakes.jpg',
      color: const Color(0xFFFFF3E0),
      destination: BreakfastPage(),
    ),
    _MealCategory(
      title: 'Lunch',
      image: 'assets/images/grilled_chicken.jpg',
      color: const Color(0xFFE0F7FA),
      destination: LunchPage(),
    ),
    _MealCategory(
      title: 'Dinner',
      image: 'assets/images/steak_veggies.jpg',
      color: const Color(0xFFEDE7F6),
      destination: DinnerPage(),
    ),
  ];

  @override
  void initState() {
    super.initState();
    filteredCategories = List.from(_allCategories);
  }

  void _onSearch(String query) {
    query = query.trim().toLowerCase();

    if (query.isEmpty) {
      setState(() {
        filteredCategories = List.from(_allCategories);
      });
      return;
    }

    final List<CategoryModel> allDishes = [
      ...breakfastDishes,
      ...lunchDishes,
      ...dinnerDishes,
    ];

    final matchingDish = allDishes.firstWhere(
      (dish) => dish.name.toLowerCase() == query,
      orElse: () => CategoryModel(
        name: '',
        image: '',
        color: Colors.transparent,
        calories: 0,
        ingredients: [],
        description: '',
      ),
    );

    if (matchingDish.name.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => CategoryDetailPage(category: matchingDish),
        ),
      );
      return;
    }

    final results = _allCategories.where((cat) {
      return cat.title.toLowerCase().contains(query);
    }).toList();

    setState(() {
      filteredCategories = results;
    });

    if (results.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No matching dish or category found')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Meal Categories', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        children: [
          _buildSearchField(),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: filteredCategories.length,
              itemBuilder: (context, index) {
                return _categoryCard(filteredCategories[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: TextField(
        controller: _searchController,
        onSubmitted: _onSearch,
        decoration: InputDecoration(
          hintText: 'Search for a dish or category...',
          prefixIcon: const Icon(Icons.search),
          filled: true,
          fillColor: Colors.grey[200],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget _categoryCard(_MealCategory category) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => category.destination),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: category.color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(category.image, height: 70, width: 70, fit: BoxFit.cover),
            ),
            const SizedBox(width: 16),
            Text(
              category.title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class _MealCategory {
  final String title;
  final String image;
  final Color color;
  final Widget destination;

  const _MealCategory({
    required this.title,
    required this.image,
    required this.color,
    required this.destination,
  });
}
