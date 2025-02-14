import 'package:flutter/material.dart';
import 'package:mycountryapp/apicomponents/countrylist.dart';
import 'package:mycountryapp/themes/provider_themes.dart';
import 'package:provider/provider.dart';


class homePage extends StatefulWidget{
  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  Widget build(BuildContext context){
    return Scaffold(
      body: SafeArea(
        child: Padding(padding: EdgeInsets.all(15),
        
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Image.asset('assets/images/darklogo.png', height: 90, width: 90,
              color: Theme.of(context).colorScheme.secondary,),
             // SizedBox(width: 10,),
              IconButton(onPressed: (){
                Provider.of<ProviderThemes>(context, listen: false).screenChanger();
              },
               icon: Icon(Icons.mode_night))
            
            ],),
          SizedBox(height: 20),
            TextField(
            decoration: InputDecoration(
              fillColor: Theme.of(context).colorScheme.primary,
              filled: true,
              labelText: 'Search Country', prefixIcon: Icon(Icons.search)
            ),
          ),
          // language and filter
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(height: 20, width: 40,
            child: Row(
              children: [
                Icon(Icons.language),
                Text('EN')
              ],
            ),
              ),
               Container(height: 20, width: 40,
            child: Row(
              children: [
                Icon(Icons.language),
                Text('FILTER')
              ],
            ),
              )

            ],
          ),
            ],),
        ),
      ),
    );
  }
}