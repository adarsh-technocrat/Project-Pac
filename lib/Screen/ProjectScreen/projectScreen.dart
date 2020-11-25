import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class ProjectScreen extends StatefulWidget {
  @override
  _ProjectScreenState createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {
  CalendarController _calendarController;
  Map<DateTime, List> _events;
  List _selectedEvents;
  @override
  void initState() {
    _calendarController = CalendarController();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }

  void _onDaySelected(DateTime day, List events, List holidays) {
    print('CALLBACK: _onDaySelected');
    setState(() {
      _selectedEvents = events;
    });
  }

  void _onVisibleDaysChanged(
      DateTime first, DateTime last, CalendarFormat format) {
    print('CALLBACK: _onVisibleDaysChanged');
  }

  void _onCalendarCreated(
      DateTime first, DateTime last, CalendarFormat format) {
    print('CALLBACK: _onCalendarCreated');
  }

  final Map<DateTime, List> _holidays = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            TableCalendar(
              calendarController: _calendarController,
              events: _events,
              holidays: _holidays,
              startingDayOfWeek: StartingDayOfWeek.monday,
              calendarStyle: CalendarStyle(
                  highlightSelected: true,
                  canEventMarkersOverflow: true,
                  selectedColor: Color(0xffE2ECFA),
                  todayColor: Color(0Xff397DE8),
                  markersColor: Color(0xff3B9888),
                  outsideDaysVisible: true,
                  selectedStyle: TextStyle().copyWith(
                    color: Color(0xff567BDA),
                  ),
                  contentDecoration: BoxDecoration()),
              headerStyle: HeaderStyle(
                formatButtonTextStyle:
                    TextStyle().copyWith(color: Colors.white, fontSize: 15.0),
                formatButtonDecoration: BoxDecoration(
                  color: Color(0Xff397DE8),
                  borderRadius: BorderRadius.circular(16.0),
                ),
              ),
              onDaySelected: _onDaySelected,
              onVisibleDaysChanged: _onVisibleDaysChanged,
              onCalendarCreated: _onCalendarCreated,
            ),
          ],
        ),
      ),
    );
  }
}
