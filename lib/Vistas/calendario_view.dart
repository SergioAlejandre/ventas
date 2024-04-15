import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarioView extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 197, 26, 26),
      appBar: AppBar(
        title: Text('Calendario de citas'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children:[
            const SizedBox(height: 20),
            Container(
              //width: 300,
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              color: Color.fromARGB(255, 255, 253, 253),
              child: TableCalendar(
                firstDay: DateTime.utc(2010, 10, 16),
                lastDay: DateTime.utc(2030, 3, 14),
                focusedDay: DateTime.now(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}