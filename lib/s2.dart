import 'package:flutter/material.dart';
import 'package:flutter_components/s3.dart';

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text("Screen 2",style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 18
        ),),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Screen3(),
                      ));
                },
                child: Text("Move to S 3 ")),
            SizedBox(height: 30,) ,
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context) ;
                },
                child: Text("Move to Back S 1 ")),
          ],
        ),
      ),
    );
  }
}
