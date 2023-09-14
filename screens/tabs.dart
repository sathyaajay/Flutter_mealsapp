import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/filters.dart';
import 'package:meals/screens/meals.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/favorites_provider.dart';
import '../models/meal.dart';
import '../widgets/main_drawer.dart';
import 'package:meals/providers/filters_provider.dart';

const  kInitialFilters = {
     Filter.glutenFree: false,
      Filter.lactoseFree: false,
      Filter.vegetarian:false,
      Filter.vegan: false,
  };

class TabsScreen extends ConsumerStatefulWidget{
  const TabsScreen({super.key});
  @override
  ConsumerState<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends ConsumerState<TabsScreen>{

  int _selectedPageIndex = 0;
  var activePageTitle = 'Categories';
  final List<Meal> _favoriteMeals = [];
 

 

  /*void _toggleMealFavoriteStatus(Meal meal){
    final isExisting = _favoriteMeals.contains(meal);

  if (isExisting){
    setState(() {
       _favoriteMeals.remove(meal);
    });
   _showInfoMessage('Meal is no longer a favorite');
  }
  else{
    setState(() {
      _favoriteMeals.add(meal);
    });
       _showInfoMessage('Added as a favorite');
    
  }
  }*/

  void _selectPage (int index){
    setState(() {
      activePageTitle = 'Your favorites';
      _selectedPageIndex = index ;
    });
  }

  void _setScreen(String identifier) async{
     Navigator.of(context).pop();
    if (identifier == 'filters'){
    await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(builder: (ctx)=> const FiltersScreen()));
    
    
    }
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals = ref.watch(filteredMealsProvider);
    Widget activePage =  CategoryScreen(
      
      availableMeals: availableMeals,
      );
    
    if(_selectedPageIndex == 1){
      final favoriteMeals = ref.watch(favoriteMealsProvider);
      activePage = MealsScreen(
        meals: favoriteMeals, 
        );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(onSelectScreen: _setScreen,),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label:"Categories"),
            BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label:"Favorites"),
        ],
        )
    );
  }
}