
import 'package:flutter/material.dart';
import '../Screens/categories_screen.dart';
import '../Screens/category_screens.dart';
import '../Screens/mealdetails.dart';
import '../Screens/404screen.dart';
import '../Screens/bottom_bar.dart';
import '../Screens/Filter_screen.dart';
import '../lib/Models/recipe.dart';
import '../widgets/dummy_data.dart';
void main() {
  runApp(MyApp());
}

class MyApp  extends StatefulWidget {

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  Map< dynamic, dynamic> Filter_model = {
    'isGluten': false,
    'isVeg': false,
    'isVegetarian': false,
    'isLactose': false,
  };
  var available_meals = DUMMY_MEALS;
  final List <Meal> favourite= [];




  void SetFilter(  Map<String, bool> foundfilter ){

    setState(() {
       Filter_model = foundfilter;
       available_meals = DUMMY_MEALS.where((meal) {

        if (Filter_model['isGluten']  && !meal.isGlutenFree) {
          return false;
        }
        if (Filter_model['isVeg'] && !meal.isVegan) {
          return false;
        }
        if (Filter_model['isVegetarian'] && !meal.isVegetarian) {
          return false;
        }
        if (Filter_model['isLactose'] && !meal.isLactoseFree) {
          return false;
        }
        else{
          return true;
        }
      }).toList();
    });
  }


  void addremove_favourite(String mealid) {
    var found_index = favourite.indexWhere((meal) => meal.id == mealid );
    if( found_index >=0){
      setState(() {
      favourite.removeAt(found_index);
      });

    }
    if(found_index < 0){
      setState(() {
      favourite.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealid));
      });

    }

   
  
  


   

  }


bool isitfavourite(String mealid){
    return favourite.any((meal) => meal.id == mealid);
}






  Widget build(BuildContext context) {
    return MaterialApp(
      title: "DeliApp",
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData
            .light()
            .textTheme
            .copyWith(
          bodyText2: TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1),
          ),
          bodyText1: TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1),
          ),
          headline6: TextStyle(
            fontSize: 24,
            fontFamily: 'RobotoCondensed',
          ),

        ),
      ),
      routes: {
        '/': (ctx) => bottom_Tabs(favourite),
        category_screens.category_route: (ctx) => category_screens(newmeals:available_meals),
        mealdetail.menu_route: (ctx) => mealdetail(isitfavourite,addremove_favourite),
        FilterScreen.route: (ctx) => FilterScreen(Filter_model,SetFilter),

      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => Error());
      },
    );
  }

}




















