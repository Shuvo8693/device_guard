import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenTimeScreen extends StatefulWidget {
  const ScreenTimeScreen({super.key});

  @override
  State<ScreenTimeScreen> createState() => _ScreenTimeScreenState();
}

class _ScreenTimeScreenState extends State<ScreenTimeScreen> {
  bool isEnabled = true;
  String selectedDay = 'Everyday';

  final Map<String, TimeLimit> timeLimits = {
    'Everyday': TimeLimit(hours: 1, minutes: 25),
    'Saturday': TimeLimit(hours: 0, minutes: 25),
    'Sunday': TimeLimit(hours: 0, minutes: 25),
    'Monday': TimeLimit(hours: 0, minutes: 25),
    'Tuesday': TimeLimit(hours: 0, minutes: 25),
    'Wednesday': TimeLimit(hours: 0, minutes: 25),
    'Thursday': TimeLimit(hours: 0, minutes: 25),
    'Friday': TimeLimit(hours: 0, minutes: 25),
  };

  Map<String, bool> dayToggles = {
    'Saturday': true,
    'Sunday': true,
    'Monday': true,
    'Tuesday': true,
    'Wednesday': true,
    'Thursday': true,
    'Friday': true,
  };

  void _showTimePickerModal(String day) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (context) => TimePickerModal(
        initialTime: timeLimits[day]!,
        onTimeSet: (hours, minutes) {
          setState(() {
            timeLimits[day] = TimeLimit(hours: hours, minutes: minutes);
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, size: 20.sp, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Screen time limit',
          style: GoogleFontStyles.h4(
            color: Colors.black87,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: false,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: Colors.white,
                    padding: EdgeInsets.all(16.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Set a screen time limit to promote healthy app usage and\nprevent excessive screen exposure.',
                          style: GoogleFontStyles.h6(
                            color: Colors.grey[600],
                            height: 1.5,
                          ),
                        ),
                        SizedBox(height: 20.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Enable screen time limit',
                              style: GoogleFontStyles.h5(
                                color: Colors.black87,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Switch(
                              value: isEnabled,
                              onChanged: (value) {
                                setState(() {
                                  isEnabled = value;
                                });
                              },
                              activeColor: const Color(0xFF4A90E2),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 12.h),
                  if (isEnabled) ...[
                    Container(
                      color: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 8.h),
                      child: Column(
                        children: [
                          _buildDayOption('Everyday', true),
                          _buildDayOption('Custom', false),
                        ],
                      ),
                    ),
                    SizedBox(height: 12.h),
                    if (selectedDay == 'Custom')
                      Container(
                        color: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 8.h),
                        child: Column(
                          children: [
                            _buildDayTimeItem('Saturday'),
                            _buildDayTimeItem('Sunday'),
                            _buildDayTimeItem('Monday'),
                            _buildDayTimeItem('Tuesday'),
                            _buildDayTimeItem('Wednesday'),
                            _buildDayTimeItem('Thursday'),
                            _buildDayTimeItem('Friday'),
                          ],
                        ),
                      )
                    else
                      Container(
                        color: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 8.h),
                        child: _buildDayTimeItem('Everyday'),
                      ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDayOption(String day, bool isEveryday) {
    bool isSelected = selectedDay == day;
    return InkWell(
      onTap: () {
        setState(() {
          selectedDay = day;
        });
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: Row(
          children: [
            Container(
              width: 20.w,
              height: 20.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? const Color(0xFF4A90E2) : Colors.grey[400]!,
                  width: 2,
                ),
                color: isSelected ? const Color(0xFF4A90E2) : Colors.transparent,
              ),
              child: isSelected
                  ? Icon(Icons.circle, size: 10.w, color: Colors.white)
                  : null,
            ),
            SizedBox(width: 12.w),
            Text(
              day,
              style: GoogleFontStyles.h5(
                color: Colors.black87,
                fontWeight: FontWeight.w400,
              ),
            ),
            const Spacer(),
            if (isEveryday && isSelected)
              Text(
                '01hr 25 min',
                style: GoogleFontStyles.h6(
                  color: Colors.grey[500],
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildDayTimeItem(String day) {
    bool isEveryday = day == 'Everyday';
    bool isToggled = isEveryday ? true : dayToggles[day] ?? true;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            day,
            style: GoogleFontStyles.h5(
              color: Colors.black87,
              fontWeight: FontWeight.w400,
            ),
          ),
          Row(
            children: [
              InkWell(
                onTap: isToggled ? () => _showTimePickerModal(day) : null,
                child: Text(
                  '${timeLimits[day]!.hours.toString().padLeft(2, '0')}hr ${timeLimits[day]!.minutes.toString().padLeft(2, '0')}min',
                  style: GoogleFontStyles.h6(
                    color: isToggled ? const Color(0xFF4A90E2) : Colors.grey[400],
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              if (!isEveryday)
                Switch(
                  value: isToggled,
                  onChanged: (value) {
                    setState(() {
                      dayToggles[day] = value;
                    });
                  },
                  activeColor: const Color(0xFF4A90E2),
                ),
            ],
          ),
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

class TimePickerModal extends StatefulWidget {
  final TimeLimit initialTime;
  final Function(int hours, int minutes) onTimeSet;

  const TimePickerModal({
    super.key,
    required this.initialTime,
    required this.onTimeSet,
  });

  @override
  State<TimePickerModal> createState() => _TimePickerModalState();
}

class _TimePickerModalState extends State<TimePickerModal> {
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

// Note: Make sure you have GoogleFontStyles class imported
class GoogleFontStyles {
  static TextStyle h3({Color? color, FontWeight? fontWeight}) {
    return TextStyle(
      fontSize: 18,
      color: color ?? Colors.black,
      fontWeight: fontWeight ?? FontWeight.w400,
    );
  }

  static TextStyle h4({Color? color, FontWeight? fontWeight}) {
    return TextStyle(
      fontSize: 16,
      color: color ?? Colors.black,
      fontWeight: fontWeight ?? FontWeight.w500,
    );
  }

  static TextStyle h5({Color? color, FontWeight? fontWeight}) {
    return TextStyle(
      fontSize: 14,
      color: color ?? Colors.black,
      fontWeight: fontWeight ?? FontWeight.w400,
    );
  }

  static TextStyle h6({Color? color, FontWeight? fontWeight, double? height}) {
    return TextStyle(
      fontSize: 12,
      color: color ?? Colors.black,
      fontWeight: fontWeight ?? FontWeight.w400,
      height: height,
    );
  }
}