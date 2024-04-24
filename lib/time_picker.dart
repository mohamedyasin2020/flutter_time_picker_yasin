import 'package:flutter/material.dart';

class TimePickerConcept extends StatefulWidget {
  const TimePickerConcept({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _TimePickerConceptState createState() => _TimePickerConceptState();
}

class _TimePickerConceptState extends State<TimePickerConcept> {
  TimeOfDay _time = TimeOfDay.now();
  late TimeOfDay picked;

  Future<void> selectTime(BuildContext context) async {
    picked = (await showTimePicker(
      context: context,
      initialTime: _time,
    ))!;
    if (picked != null) {
      setState(() {
        _time = picked;
        print(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                selectTime(context);
              },
              iconSize: 80,
              icon: Icon(Icons.alarm),
            ),
            SizedBox(height: 20),
            Text(
              _time != null ? _time.format(context) : 'Select a time',
              style: TextStyle(fontSize: 40),
            ),
          ],
        ),
      ),
    );
  }
}
