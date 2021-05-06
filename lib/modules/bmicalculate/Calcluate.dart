
import 'package:flutter/material.dart';

class Calculate extends StatelessWidget {
  final bool ismal;
  final double result;
  final double height;

  const Calculate({Key key, this.ismal, this.result, this.height}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculate'),
        centerTitle: true,

      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          Text('Gander:${ismal?'male':'female'}'),
            SizedBox(height: 20.0,),
            Text('height :${height.round()}'),
            SizedBox(height: 20.0,),
            Text('Result :${result.round()}'),


          ],
        ),
      ),
    );
  }
}
