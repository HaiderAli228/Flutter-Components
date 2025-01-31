import 'package:flutter/material.dart';
class AlertScreen extends StatelessWidget {
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
            Text("Bottom Sheet Alert", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
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
      appBar: AppBar(title: Text("Flutter Alerts")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => showAlertDialog(context),
              child: Text("Simple Alert"),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => showConfirmationDialog(context),
              child: Text("Confirmation Alert"),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => showBottomSheet(context),
              child: Text("Bottom Sheet Alert"),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => showSnackBar(context),
              child: Text("SnackBar Alert"),
            ),
          ],
        ),
      ),
    );
  }
}
