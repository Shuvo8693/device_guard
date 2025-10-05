
import 'package:device_guard/common/app_text_style/google_font_style.dart';
import 'package:device_guard/common/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum AppRuleStatus { blocked, limited, allowed }

class AppRuleItem {
  final String appName;
  final String icon;
  final AppRuleStatus status;
  final String? timeLimit;

  AppRuleItem({
    required this.appName,
    required this.icon,
    required this.status,
    this.timeLimit,
  });
}

class AppRulesScreen extends StatefulWidget {
  const AppRulesScreen({super.key});

  @override
  State<AppRulesScreen> createState() => _AppRulesScreenState();
}

class _AppRulesScreenState extends State<AppRulesScreen> {
  AppRuleStatus? _selectedFilter;

  final List<AppRuleItem> _apps = [
    AppRuleItem(
      appName: 'Instagram',
      icon: '📷',
      status: AppRuleStatus.blocked,
    ),
    AppRuleItem(
      appName: 'Instagram',
      icon: '💼',
      status: AppRuleStatus.limited,
      timeLimit: '01:30 min',
    ),
    AppRuleItem(
      appName: 'Instagram',
      icon: '🎮',
      status: AppRuleStatus.allowed,
    ),
    AppRuleItem(
      appName: 'Instagram',
      icon: '🎮',
      status: AppRuleStatus.allowed,
    ),
    AppRuleItem(
      appName: 'Instagram',
      icon: '🎮',
      status: AppRuleStatus.allowed,
    ),
    AppRuleItem(
      appName: 'Instagram',
      icon: '🎮',
      status: AppRuleStatus.allowed,
    ),
  ];

  List<AppRuleItem> get _filteredApps {
    if (_selectedFilter == null) return _apps;
    return _apps.where((app) => app.status == _selectedFilter).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "App's Rule",
          style: GoogleFontStyles.h3(
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Filter Chips
            Container(
              padding: EdgeInsets.all(16.w),
              color: Colors.white,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildFilterChip('All', null),
                    SizedBox(width: 8.w),
                    _buildFilterChip('Block', AppRuleStatus.blocked),
                    SizedBox(width: 8.w),
                    _buildFilterChip('Limited', AppRuleStatus.limited),
                    SizedBox(width: 8.w),
                    _buildFilterChip('Allowed', AppRuleStatus.allowed),
                  ],
                ),
              ),
            ),

            // App List
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(16.w),
                itemCount: _filteredApps.length,
                itemBuilder: (context, index) {
                  final app = _filteredApps[index];
                  return _buildAppItem(app);
                },
              ),
            ),

            // Add Suspicious Word Button
            Padding(
              padding: EdgeInsets.all(16.w),
              child: CustomButton(
                text: 'Add suspicious word',
                onTap: () {
                  // Handle add suspicious word
                },
              ),
            ),

            // Bottom Action Buttons
            Container(
              padding: EdgeInsets.all(16.w),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildActionButton(
                    icon: Icons.block,
                    label: 'Block',
                    color: Colors.red,
                  ),
                  _buildActionButton(
                    icon: Icons.access_time,
                    label: 'Limited',
                    color: Colors.orange,
                  ),
                  _buildActionButton(
                    icon: Icons.check_circle_outline,
                    label: 'Allow',
                    color: Colors.green,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterChip(String label, AppRuleStatus? status) {
    final isSelected = _selectedFilter == status;
    Color bgColor;
    Color textColor;

    if (label == 'All') {
      bgColor = isSelected ? Colors.black : Colors.white;
      textColor = isSelected ? Colors.white : Colors.black;
    } else if (label == 'Block') {
      bgColor = isSelected ? Colors.red[50]! : Colors.white;
      textColor = Colors.red;
    } else if (label == 'Limited') {
      bgColor = isSelected ? Colors.orange[50]! : Colors.white;
      textColor = Colors.orange;
    } else {
      bgColor = isSelected ? Colors.green[50]! : Colors.white;
      textColor = Colors.green;
    }

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedFilter = status;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: isSelected ? textColor : Colors.grey[300]!,
          ),
        ),
        child: Text(
          label,
          style: GoogleFontStyles.h6(
            color: textColor,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
      ),
    );
  }

  Widget _buildAppItem(AppRuleItem app) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [

          // App Icon
          Container(
            width: 40.w,
            height: 40.h,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Center(
              child: Text(
                app.icon,
                style: TextStyle(fontSize: 24.sp),
              ),
            ),
          ),
          SizedBox(width: 12.w),

          // App Name
          Expanded(
            child: Text(
              app.appName,
              style: GoogleFontStyles.h5(
                color: Colors.black87,
              ),
            ),
          ),

          // Time Limit (if limited)
          if (app.timeLimit != null) ...[
            Text(
              app.timeLimit!,
              style: GoogleFontStyles.h6(
                color: Colors.grey[600],
              ),
            ),
            SizedBox(width: 8.w),
          ],

          // Status Badge
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
            decoration: BoxDecoration(
              color: _getStatusColor(app.status).withOpacity(0.2),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Text(
              _getStatusLabel(app.status),
              style: GoogleFontStyles.h6(
                color: _getStatusColor(app.status),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required Color color,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 56.w,
          height: 56.h,
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: color,
            size: 28.sp,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          label,
          style: GoogleFontStyles.h6(
            color: Colors.black87,
          ),
        ),
      ],
    );
  }

  Color _getStatusColor(AppRuleStatus status) {
    switch (status) {
      case AppRuleStatus.blocked:
        return Colors.red;
      case AppRuleStatus.limited:
        return Colors.orange;
      case AppRuleStatus.allowed:
        return Colors.green;
    }
  }

  String _getStatusLabel(AppRuleStatus status) {
    switch (status) {
      case AppRuleStatus.blocked:
        return 'Blocked';
      case AppRuleStatus.limited:
        return 'Limited';
      case AppRuleStatus.allowed:
        return 'Allowed';
    }
  }
}