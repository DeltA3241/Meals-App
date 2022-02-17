import 'package:flutter/material.dart';
import '../widgets/Main_Drawer.dart';


class FilterScreen extends StatefulWidget {
 static const route = '/filter_screen';

 final Function settingfilter;
 final Map<dynamic, dynamic> base_Filter;

 FilterScreen( this.base_Filter,this.settingfilter);



  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {


  var _isGlutenFree = false;
  var _isVegan = false;
  var _isVegetarian = false;
  var _isLactoseFree = false;

  initState(){
    _isGlutenFree = widget.base_Filter['isGluten'];
    _isVegetarian = widget.base_Filter['isVegetarian'];
    _isVegan = widget.base_Filter['isVeg'];
    _isLactoseFree = widget.base_Filter['isLactose'];
    super.initState();
  }


  Widget Build_Switch_tiles( String name, String descrip, bool current_value,  VoidCallback update(bool)){
    return SwitchListTile(
      title: Text(name),
      subtitle: Text(descrip),
      value: current_value,
      onChanged:  update,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Filters"), actions: [
        IconButton( onPressed:(){
          final selectedfilters ={
    "isGluten": _isGlutenFree,
    "isVeg": _isVegan,
    "isVegetarian": _isVegetarian,
    "isLactose":_isLactoseFree,
    };
        widget.settingfilter(selectedfilters);}, icon: Icon(Icons.save)),
      ],),
      drawer: Main_Drawer(),
      body: Column(
        children: [
          Container(
          padding: EdgeInsets.all(20),
          alignment: Alignment.center,
          child: Text("These are your filters", style: Theme.of(context).textTheme.headline6, ),
        ),
          Expanded(
          child: Column(
          children: [
            SwitchListTile(
              title:Text("Gluten"),
              subtitle: Text("Is it Gluten Free"),
              value: _isGlutenFree,
              onChanged: (New_Value){
                setState(() {
                  _isGlutenFree = New_Value;
                });
              },

            )
            , SwitchListTile(
              title:Text("Veg"),
              subtitle: Text("Food For vegans"),
              value: _isVegan,
              onChanged: (New_Value){
                setState(() {
                  _isVegan =New_Value;
                });
              },

            ),SwitchListTile(
              title:Text("Vegetarian"),
              subtitle: Text("Food that does not contain any form of animal or animal products"),
              value: _isVegetarian,
              onChanged: (New_Value){
                setState(() {
                  _isVegetarian =New_Value;
                });
              },

            ),
           SwitchListTile(
    title:Text("lactose"),
    subtitle: Text("Food that does not contain any form of dairy or dairy products"),
    value: _isLactoseFree,
    onChanged: (New_Value){
    setState(() {
    _isLactoseFree =New_Value;
    });
    },

    ),


          ],
          )


          ),
          
    ]
      ),
    );
  }
}
