import 'package:flutter/material.dart';
import 'package:flutter_components/s1.dart';

class Screen3 extends StatelessWidget {
  const Screen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text(
          "Screen 3",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
        ),
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
                        builder: (context) => Screen1(),
                      ));
                },
                child: Text("Move to S1")),
            SizedBox(height: 20,),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context) ;
                },
                child: Text("Move to S2 again")),
          ],
        ),
      ),
    );
  }
}
