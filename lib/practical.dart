import 'package:flutter/material.dart';

class Practical extends StatefulWidget {
  const Practical({super.key});

  @override
  State<Practical> createState() => _PracticalState();
}

class _PracticalState extends State<Practical> {
  Widget showText() {
    return Column(
      children: [
        Text("show 1"),
        Text("show 2"),
        Text("show 3"),
        Text("show 4"),
        Text("show 5")
      ],
    );
  }
bool press = false ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text(
          "Practical ",
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    press = !press ;
                  });
                },
                child: Text(
                  "Show Text",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                )),
           SizedBox(height: 40,),
           Container(
             child: press ? Column(
               children: [
                 Text("show 1"),
                 Text("show 2"),
                 Text("show 3"),
                 Text("show 4"),
                 Text("show 5")
               ],
             ) : Text(""),
           )
          ],
        ),
      ),
    );
  }
}
