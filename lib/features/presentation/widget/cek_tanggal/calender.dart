// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:pinjem_in_app/app/config/themes/app_theme.dart';
import 'package:table_calendar/table_calendar.dart';

class CalenderEvent extends StatefulWidget {
  const CalenderEvent({
    required this.today,
    required this.selectedDay,
    required this.eventLoader,
    super.key,
  });

  final DateTime today;
  final void Function(DateTime, DateTime) selectedDay;
  final List<dynamic> Function(DateTime) eventLoader;

  @override
  State<CalenderEvent> createState() => _CalenderEventState();
}

class _CalenderEventState extends State<CalenderEvent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          border: Border.all(color: secondaryTextColor),
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.all(20),
        child: TableCalendar<dynamic>(
          eventLoader: widget.eventLoader,
          locale: 'id_ID',
          shouldFillViewport: true,
          calendarStyle: CalendarStyle(
            tableBorder: TableBorder.all(color: const Color(0xffECECEC)),
            selectedDecoration: BoxDecoration(
              shape: BoxShape.circle,
              color: primaryColor,
            ),
            markerDecoration:
                BoxDecoration(color: primaryColor, shape: BoxShape.circle),
            markerMargin: const EdgeInsets.only(top: 15, left: 1.5, right: 1.5),
            todayDecoration: BoxDecoration(
              shape: BoxShape.circle,
              color: primaryColor.withOpacity(0.7),
            ),
            selectedTextStyle: titleTextStyle.copyWith(color: Colors.white),
          ),
          headerStyle: HeaderStyle(
            titleTextStyle: secondaryTextStyle.copyWith(fontSize: 16),
            titleCentered: true,
            formatButtonVisible: false,
          ),
          focusedDay: widget.today,
          firstDay: DateTime.utc(2010, 01, 31),
          lastDay: DateTime.utc(2030, 12, 31),
          onDaySelected: widget.selectedDay,
          selectedDayPredicate: (day) => isSameDay(day, widget.today),
        ),
      ),
    );
  }
}
