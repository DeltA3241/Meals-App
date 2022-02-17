import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Screens/category_screens.dart';
class Aes extends StatelessWidget {
  final String id;
  final String title;
  final Color color;


  Aes( this.id , this.title,  this.color, );

  void selectCategory(BuildContext ctx) {
   Navigator.of(ctx).pushNamed(
       "/category", arguments: {'id':id, "title":title},
   );
  }


  @override
  Widget build(BuildContext context) {
    return InkWell(
          onTap: (){selectCategory(context);},
          splashColor: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(15),
      child: Container(
      padding: EdgeInsets.all(20),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
        decoration:  BoxDecoration(gradient: LinearGradient(
          colors: [color.withOpacity(0.7), color,],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
          borderRadius: BorderRadius.circular(15),
        ),

      ),
    );
  }
}
