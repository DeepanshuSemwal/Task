import 'package:flutter/material.dart';

import 'Screen3.dart';

class Screen2 extends StatelessWidget {
  const Screen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
          padding: EdgeInsets.all(150),
        child: ElevatedButton(

          child: Text("Ftech Data"),
          onPressed: ()
          {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Screen3()));
          },
        ),
      ),
    );
  }
}
