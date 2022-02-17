
import 'package:flutter/material.dart';
import '../widgets/dummy_data.dart';
import '../widgets/Recipe_widget.dart';
import '../lib/Models/recipe.dart';
class  category_screens extends StatefulWidget {
 static const category_route = "/category";
 final List<Meal> newmeals;

 category_screens({required this.newmeals});

  @override
  State<category_screens> createState() => _category_screensState();
}

class _category_screensState extends State<category_screens> {
   late String Categorytitle;
   List<Meal> menu_list= [];
  @override
  void didChangeDependencies() {
      final args = ModalRoute.of(context)!.settings.arguments as Map<String,String>;
      Categorytitle = args['title']!;
      final id = args['id'];
      menu_list = widget.newmeals.where((meal) {
        return meal.categories.contains(id);}).cast<Meal>().toList();

      super.didChangeDependencies();
  }
  void Deletefromlist(String mealid){
    setState(() {
      menu_list.removeWhere((meal)=> mealid == meal.id);
    });

}





  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar( title: Text(Categorytitle),),

      body: ListView.builder(itemBuilder: (ctx,index) {
        return RecipeWidget(title:menu_list[index].title, id: menu_list[index].id,imageUrl:menu_list[index].imageUrl,duration:menu_list[index].duration,complexity: menu_list[index].complexity, affordability: menu_list[index].affordability);
      }, itemCount: menu_list.length,)
    );
  }
}
