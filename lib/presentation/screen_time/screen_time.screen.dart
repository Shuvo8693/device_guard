import 'package:device_guard/common/app_text_style/google_font_style.dart';
import 'package:device_guard/common/custom_appbar/custom_appbar.dart';
import 'package:device_guard/presentation/screen_time/widgets/time_picker_widgets.dart';
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
      builder: (context) => TimePickerWidgets(
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
      appBar: CustomAppBar(title: 'Screen time limit',),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8.sp),
          child: Column(
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
        ),
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




