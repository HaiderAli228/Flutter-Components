import 'package:flutter/material.dart';

class AlertScreen extends StatelessWidget {
  const AlertScreen({super.key});

  void showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Simple Alert"),
        content: Text("This is a simple alert dialog."),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("OK"),
          ),
        ],
      ),
    );
  }

  void showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Confirmation Alert"),
        content: Text("Are you sure you want to proceed?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              // Perform action here
            },
            child: Text("Yes"),
          ),
        ],
      ),
    );
  }

  void showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Bottom Sheet Alert",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text("This is a bottom sheet alert."),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Close"),
            )
          ],
        ),
      ),
    );
  }

  void showSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("This is a SnackBar alert."),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.purple,
          centerTitle: true,
          title: Text(
            "Flutter Alerts",
            style: TextStyle(color: Colors.white),
          )),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => showAlertDialog(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Colors.purple, // Change to any color you want
                ),
                child: Text(
                  "Simple Alert",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () => showConfirmationDialog(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Colors.purple, // Change to any color you want
                ),
                child: Text(
                  "Confirmation Alert",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () => showBottomSheet(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Colors.purple, // Change to any color you want
                ),
                child: Text(
                  "Bottom Sheet Alert",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () => showSnackBar(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Colors.purple, // Change to any color you want
                ),
                child: Text(
                  "SnackBar Alert",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
