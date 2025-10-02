import 'package:device_guard/common/app_text_style/google_font_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TimePickerWidgets extends StatefulWidget {
  final TimeLimit initialTime;
  final Function(int hours, int minutes) onTimeSet;

  const TimePickerWidgets({
    super.key,
    required this.initialTime,
    required this.onTimeSet,
  });

  @override
  State<TimePickerWidgets> createState() => _TimePickerWidgetsState();
}

class _TimePickerWidgetsState extends State<TimePickerWidgets> {
  late FixedExtentScrollController hoursController;
  late FixedExtentScrollController minutesController;
  late int selectedHours;
  late int selectedMinutes;

  @override
  void initState() {
    super.initState();
    selectedHours = widget.initialTime.hours;
    selectedMinutes = widget.initialTime.minutes;
    hoursController = FixedExtentScrollController(initialItem: selectedHours);
    minutesController = FixedExtentScrollController(initialItem: selectedMinutes ~/ 5);
  }

  @override
  void dispose() {
    hoursController.dispose();
    minutesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Screen time',
            style: GoogleFontStyles.h4(
              color: Colors.black87,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 20.h),
          Text(
            'Set a screen time limit to promote healthy app usage and\nprevent excessive screen exposure.',
            textAlign: TextAlign.center,
            style: GoogleFontStyles.h6(
              color: Colors.grey[600],
              height: 1.5,
            ),
          ),
          SizedBox(height: 30.h),
          Container(
            height: 200.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Hours picker
                SizedBox(
                  width: 100.w,
                  child: ListWheelScrollView.useDelegate(
                    controller: hoursController,
                    itemExtent: 50.h,
                    perspective: 0.005,
                    diameterRatio: 1.2,
                    physics: const FixedExtentScrollPhysics(),
                    onSelectedItemChanged: (index) {
                      setState(() {
                        selectedHours = index;
                      });
                    },
                    childDelegate: ListWheelChildBuilderDelegate(
                      childCount: 24,
                      builder: (context, index) {
                        return Center(
                          child: Text(
                            '${index.toString().padLeft(2, '0')}h',
                            style: GoogleFontStyles.h3(
                              color: index == selectedHours
                                  ? Colors.black87
                                  : Colors.grey[400],
                              fontWeight: index == selectedHours
                                  ? FontWeight.w600
                                  : FontWeight.w400,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(width: 40.w),
                // Minutes picker
                SizedBox(
                  width: 100.w,
                  child: ListWheelScrollView.useDelegate(
                    controller: minutesController,
                    itemExtent: 50.h,
                    perspective: 0.005,
                    diameterRatio: 1.2,
                    physics: const FixedExtentScrollPhysics(),
                    onSelectedItemChanged: (index) {
                      setState(() {
                        selectedMinutes = index * 5;
                      });
                    },
                    childDelegate: ListWheelChildBuilderDelegate(
                      childCount: 12,
                      builder: (context, index) {
                        int minutes = index * 5;
                        return Center(
                          child: Text(
                            '${minutes.toString().padLeft(2, '0')}m',
                            style: GoogleFontStyles.h3(
                              color: minutes == selectedMinutes
                                  ? Colors.black87
                                  : Colors.grey[400],
                              fontWeight: minutes == selectedMinutes
                                  ? FontWeight.w600
                                  : FontWeight.w400,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30.h),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                widget.onTimeSet(selectedHours, selectedMinutes);
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF4A90E2),
                padding: EdgeInsets.symmetric(vertical: 16.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                elevation: 0,
              ),
              child: Text(
                'Set time',
                style: GoogleFontStyles.h5(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          SizedBox(height: 10.h),
        ],
      ),
    );
  }
}

class TimeLimit {
  int hours;
  int minutes;

  TimeLimit({required this.hours, required this.minutes});
}