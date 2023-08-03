import 'package:flutter/material.dart';
import 'package:task2/screens/screen2.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar: BottomAppBar(
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(child: IconButton(icon: Icon(Icons.home),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Screen2()));
              },),),
            Expanded(child: IconButton(icon: Icon(Icons.show_chart),
              onPressed: () {

              },),),
            Expanded(child: new Text('')),
            Expanded(child: IconButton(icon: Icon(Icons.tab),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Screen2()));

              },),),
            Expanded(child: IconButton(icon: Icon(Icons.settings),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Screen2()));

              },),),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}


