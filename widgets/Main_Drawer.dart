import 'package:flutter/material.dart';
import '../Screens/categories_screen.dart';
import '../Screens/Filter_screen.dart';


class Main_Drawer extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            color: Theme.of(context).accentColor,
            child: Text("Cooking up!", style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 30),),
            alignment: Alignment.centerLeft,
          ),
          SizedBox(height: 10,),
          ListTile(
            leading: Icon(Icons.restaurant, size: 40,), title: Text('Menu', style: TextStyle(fontSize: 25 ),),
            onTap: (){
              Navigator.of(context).pushReplacementNamed(CategoriesScreen.categoryscreen_route);
          },
          ),
          ListTile(
            leading: Icon(Icons.settings, size:40), title: Text('Filters', style: TextStyle(fontSize: 25),),
            onTap: (){
              Navigator.of(context).pushReplacementNamed(FilterScreen.route);
            },
          )
        ],
      ),
    );
}
}