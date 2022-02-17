import 'package:flutter/material.dart';
import '../widgets/Recipe_widget.dart';
import '../lib/Models/recipe.dart';



class Favourite extends StatelessWidget {
  final List<Meal> fav_meal;
  Favourite(this.fav_meal);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("These are your favourites"),),
      body:ListView.builder(itemBuilder: (ctx,index) {
        return RecipeWidget(title:fav_meal[index].title, id: fav_meal[index].id,imageUrl:fav_meal[index].imageUrl,duration:fav_meal[index].duration,complexity: fav_meal[index].complexity, affordability: fav_meal[index].affordability);
      }, itemCount: fav_meal.length,)
    );
  }
}
