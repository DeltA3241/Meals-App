
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/dummy_data.dart';

class mealdetail extends StatelessWidget {
static const menu_route = '/menu_detail';
final Function checkfavourite;
final Function togglefavourite;

mealdetail(this.checkfavourite, this.togglefavourite);


  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String,String>;
    final title = args['title'];
    final id1 = args['id'];
    final recipe = DUMMY_MEALS.firstWhere((Meal) => Meal.id == id1);
    Widget BuildTitle( BuildContext context, text){
      return Container(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline6,
          )
      );
    }

    Widget CustomContainer( Widget child){
      return Container(
        height: 150,
        width: 300,
        decoration: BoxDecoration(color: Colors.white, border:Border.all(color: Colors.black), borderRadius: BorderRadius.circular(5)),
        margin: EdgeInsets.all(10) ,
        padding: EdgeInsets.all(10),
        child:child ,
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text(title!),),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
            height: 300,
              width:450,
              child: Image.network(recipe.imageUrl, fit: BoxFit.cover,),
          ),
            BuildTitle(context, 'ingredients'),
            CustomContainer(ListView.builder( itemBuilder: (ctx,index)
            {
              return Card(

                color: Theme.of(context).accentColor,

                child: Padding(
                  padding: EdgeInsets.symmetric( vertical: 5, horizontal: 10),
                  child:Text(recipe.ingredients[index]),
                ),

              );

            },
              itemCount: recipe.ingredients.length,)),
            BuildTitle(context, 'Recipe'),
            CustomContainer(
              ListView.builder(itemBuilder: (ctx,index){
                return ListTile(
                  leading: CircleAvatar(child: Text('# ${index+1}')),
                   title: Text(recipe.steps[index]),

                  );
              },
              itemCount: recipe.steps.length,)
            ),
            
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=>(togglefavourite(id1)),
        child: Icon( checkfavourite(id1)? Icons.star : Icons.star_border),
      ),
    );
  }
}
