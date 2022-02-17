
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../lib/Models/recipe.dart';
import '../Screens/mealdetails.dart';

class RecipeWidget extends StatelessWidget {
  final String title;
  final String id;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;


  RecipeWidget( {required this.title, required this.id, required this.imageUrl,required this.duration ,required this.complexity, required this.affordability,});

   void Recipe_route(ctx){
     Navigator.of(ctx).pushNamed( mealdetail.menu_route, arguments: { "id":id,"title":title},);
   }

   String get getComplexity{
     switch(complexity) {

       case Complexity.Simple:
         return 'Simple';
         break;
       case Complexity.Hard:
         return 'Hard';
         break;
       case Complexity.Challenging:
         return 'Challenging';
         break;

         default:
         return "Unknown";

     }
   }

  String get getAffordability{
    switch(affordability) {

      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Luxurious:
        return 'luxurious';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;

      default:
        return "Unknown";

    };
  }


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){ Recipe_route(context);},
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 4,
          margin: EdgeInsets.all(10),
          child: Column(
            children: [ Stack(
              children: [
                ClipRRect(borderRadius: BorderRadius.only(
                  bottomLeft:Radius.circular(15),
                  bottomRight:Radius.circular(15),
                ),
                  child: Image.network(imageUrl, height: 250, width: double.infinity, fit: BoxFit.cover ),
                ),
               Positioned(
                bottom: 20,
                right: 10,
                 child: Container(
                   padding: EdgeInsets.all(5),
                   width: 300,
                   color: Colors.black54,
                   child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                   ),
                   softWrap: true,
                   overflow: TextOverflow.fade,
            ),
                 ),


               ),
          ],
          ),
           Container(
             padding: EdgeInsets.all(25),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceAround,
               children: [
                    Row(
                      children:[ Icon(
                        Icons.schedule,
                        size: 24,
                      ),
                    SizedBox(width: 6,),
                    Text('$duration mins'),
                  ],
          ),
                    Row(
                      children: [Icon(
                        Icons.work,
                        size: 24,
                      ),
                    SizedBox(width: 6,),
                    Text(getComplexity),
    ],
           ),
                    Row(
                      children: [Icon(
                        Icons.attach_money,
                        size: 24,
                      ),

                    SizedBox(width: 6,),
                    Text(getAffordability),
                  ],
                    ),
            ],

             ),
           ),
          ],

        )
    )
    );
  }
}
