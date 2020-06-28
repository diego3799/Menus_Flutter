import 'package:flutter/material.dart';
import 'package:restaurant_flutter/models/meal.dart';
import 'package:restaurant_flutter/widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  final List<Meal> availableMeals;
  CategoryMealsScreen(this.availableMeals);
  // final categoryId, categorTitle;
  // CategoryMealsScreen(this.categoryId, this.categorTitle);
  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  @override
  String categoryTitle;
  List<Meal> displayedMeals;
  bool _loadedInitData = false;
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'];
      final id = routeArgs['id'];
      displayedMeals = widget.availableMeals
          .where((item) => item.categories.contains(id))
          .toList();
      // TODO: implement didChangeDependencies
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((item) => item.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, i) {
            return MealItem(
                id: displayedMeals[i].id,
                title: displayedMeals[i].title,
                imageUrl: displayedMeals[i].imageUrl,
                affordability: displayedMeals[i].affordability,
                complexity: displayedMeals[i].complexity,
                duration: displayedMeals[i].duration);
          },
          itemCount: displayedMeals.length,
        ));
  }
}
