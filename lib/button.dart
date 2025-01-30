import 'package:flutter/material.dart';

class FlutterButton extends StatefulWidget {
  const FlutterButton({super.key});

  @override
  State<FlutterButton> createState() => _FlutterButtonState();
}

class _FlutterButtonState extends State<FlutterButton> {
  void showMsg(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.purple,
        title: Text(
          "Button in Flutter",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 26),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    showMsg("Elevated Button Pressed");
                  },
                  child: Text(
                    "Elevated Button",
                    style: TextStyle(fontSize: 18),
                  )),
              SizedBox(
                height: 30,
              ),
              TextButton(
                  onPressed: () {
                    showMsg("Text Button Pressed");
                  },
                  child: Text(
                    "Text Button",
                  )),
              SizedBox(
                height: 30,
              ),
              OutlinedButton(
                  onPressed: () {
                    showMsg("Outlined Button Pressed");
                  },
                  child: Text("Outlined Button")),
              SizedBox(
                height: 30,
              ),
              IconButton(
                  onPressed: () {
                    showMsg("Icons Button Pressed");
                  },
                  icon: Icon(
                    Icons.account_circle,
                    color: Colors.purple,
                  )),
              SizedBox(
                height: 30,
              ),
              FilledButton(
                  onPressed: () {
                    showMsg("Filled Button Pressed");
                  },
                  child: Text("Filled Button")),
              SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () {
                  showMsg("Custom Button Pressed");
                },
                child: Container(
                  height: 54,
                  width: 220,
                  decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(6),
                  child: Text(
                    "Custom Button ",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
