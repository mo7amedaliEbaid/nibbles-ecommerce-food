import 'package:flutter/material.dart';
import 'package:nibbles_ecommerce/configs/configs.dart';
import 'package:nibbles_ecommerce/core/constants/colors.dart';
import 'package:table_calendar/table_calendar.dart';

class OrderCalendar extends StatefulWidget {
  const OrderCalendar({super.key, required this.selectedDate});

  final DateTime selectedDate;

  @override
  OrderCalendarState createState() => OrderCalendarState();
}

class OrderCalendarState extends State<OrderCalendar> {
  CalendarFormat _calendarFormat = CalendarFormat.month;

  DateTime? rangeStart = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final kLastDay = DateTime(widget.selectedDate.year,
        widget.selectedDate.month, widget.selectedDate.day);
    DateTime? focusedDay = widget.selectedDate;
    DateTime? rangeEnd = widget.selectedDate;
    final kToday = DateTime.now();
    final kFirstDay = DateTime(kToday.year, kToday.month, kToday.day);
    return Padding(
      padding: Space.hf(),
      child: Material(
        elevation: 2,
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppDimensions.normalize(12)),
        child: SizedBox(
          height: AppDimensions.normalize(144),
          child: TableCalendar(
            rowHeight: AppDimensions.normalize(17),
            firstDay: kFirstDay,
            lastDay: kLastDay,
            focusedDay: focusedDay,
            rangeStartDay: rangeStart,
            rangeEndDay: rangeEnd,
            calendarFormat: _calendarFormat,
            daysOfWeekStyle: DaysOfWeekStyle(weekdayStyle: AppText.b1b!),
            calendarStyle: CalendarStyle(
                rangeStartDecoration: const BoxDecoration(
                  color: AppColors.antiqueRuby,
                  shape: BoxShape.circle,
                ),
                rangeStartTextStyle: AppText.b2b!,
                rangeEndTextStyle: AppText.b2b!,
                rangeEndDecoration: const BoxDecoration(
                  color: AppColors.commonAmber,
                  shape: BoxShape.circle,
                ),
                rangeHighlightColor: AppColors.lightGrey),
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                setState(() {
                  _calendarFormat = format;
                });
              }
            },
            onPageChanged: (focusedDay) {
              focusedDay = focusedDay;
            },
            calendarBuilders: CalendarBuilders(
              rangeHighlightBuilder: (context, day, isWithinRange) {
                return isWithinRange
                    ? Center(
                        child: Container(
                          height: AppDimensions.normalize(12),
                          width: AppDimensions.normalize(12),
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.greyText),
                        ),
                      )
                    : null;
              },
            ),
          ),
        ),
      ),
    );
  }
}
