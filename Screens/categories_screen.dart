import 'package:flutter/material.dart';
import 'category_screens.dart';
import '../widgets/category_aes.dart';
import '../widgets/dummy_data.dart';
import '../Screens/categories_screen.dart';
class CategoriesScreen extends StatelessWidget {
  static const categoryscreen_route = '/';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(title: Text("DeliMenu"),),
      body: GridView(
          padding: const EdgeInsets.all(20),
          children: [
            ...DUMMY_CATEGORIES.map( (getdata) => Aes(getdata.id,getdata.title,getdata.color),).toList(),
          ],
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 1.0,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
        ),
    );
  }
}
