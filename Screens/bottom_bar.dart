import 'package:flutter/material.dart';
import 'categories_screen.dart';
import './Favourite_screen.dart';
import '../widgets/Main_Drawer.dart';
import '../lib/Models/recipe.dart';
class bottom_Tabs extends StatefulWidget {
 List<Meal> fav1;
 bottom_Tabs(this.fav1);

  @override
  bottom_TabsState createState() => bottom_TabsState();
}

class bottom_TabsState extends State<bottom_Tabs> {
  List<Widget> Screens = [];
  int _selected_page_index = 0;
  void _selectedpage(index){
    setState(() {
      _selected_page_index = index;
    });
  }
  @override
  void initState() {
     Screens=[
      CategoriesScreen(),
      Favourite(widget.fav1),
    ];
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Screens[_selected_page_index],
      drawer: Main_Drawer(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectedpage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white ,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selected_page_index,
        items: [
          BottomNavigationBarItem(
            icon:Icon(Icons.category),
            title: Text("Category"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text("Favourties"),
          ),
        ],

      ),
    );
  }
}
