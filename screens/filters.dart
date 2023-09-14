import 'package:flutter/material.dart';
//import 'package:meals/screens/tabs.dart';
import 'package:meals/providers/filters_provider.dart';
//import '../widgets/main_drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//enum Filter{
 // glutenFree,
 // lactoseFree,
 // vegetarian,
 // vegan,
//}

class FiltersScreen extends ConsumerWidget{
  const FiltersScreen({super.key});


   @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filterProvider);
  return Scaffold(
    appBar: AppBar(
      title: const Text('Your Filters'),
    ),
    /*drawer: MainDrawer(onSelectScreen: (identifier){
      Navigator.of(context).pop();
      if (identifier == 'meals'){
        Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>TabsScreen()));
      }
    },
    ),*/
    body: Column(children: [
         SwitchListTile(
          value: activeFilters[Filter.glutenFree]!, 
          onChanged: (isChecked){
           ref.read(filterProvider.notifier).setFilter(Filter.glutenFree, isChecked);
          },
          title:Text('Gluten-Free',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                      ),
                      ),
          subtitle: Text('Only include Gluten free meals',
                     style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                      ),
                           ) ,
           activeColor: Theme.of(context).colorScheme.tertiary,
           contentPadding: const EdgeInsets.only(left: 34, right: 22),                
          ),
    
    
          SwitchListTile(
          value:  activeFilters[Filter.lactoseFree]!, 
          onChanged: (isChecked){
            ref.read(filterProvider.notifier).setFilter(Filter.lactoseFree, isChecked);
          },
          title:Text('Lactose-Free',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                      ),
                      ),
          subtitle: Text('Only include Lactose free meals',
                     style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                      ),
                           ) ,
           activeColor: Theme.of(context).colorScheme.tertiary,
           contentPadding: const EdgeInsets.only(left: 34, right: 22),                
          ),
    
    
          SwitchListTile(
          value: activeFilters[Filter.vegetarian]!, 
          onChanged: (isChecked){
            ref.read(filterProvider.notifier).setFilter(Filter.vegetarian, isChecked);
          },
          title:Text('Vegetarian',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                      ),
                      ),
          subtitle: Text('Only include vegetarian meals',
                     style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                      ),
                           ) ,
           activeColor: Theme.of(context).colorScheme.tertiary,
           contentPadding: const EdgeInsets.only(left: 34, right: 22),                
          ),
    
    
          SwitchListTile(
          value: activeFilters[Filter.vegan]!, 
          onChanged: (isChecked){
            ref.read(filterProvider.notifier).setFilter(Filter.vegan, isChecked);
           
          },
          title:Text('Vegan',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                      ),
                      ),
          subtitle: Text('Only include vegan meals',
                     style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                      ),
                           ) ,
           activeColor: Theme.of(context).colorScheme.tertiary,
           contentPadding: const EdgeInsets.only(left: 34, right: 22),                
          ),
    
      ],
      ),
    );
  
  }
}