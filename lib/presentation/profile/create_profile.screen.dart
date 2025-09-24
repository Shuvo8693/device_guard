import 'package:device_guard/common/app_text_style/google_font_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:device_guard/common/app_color/app_colors.dart';
import 'package:device_guard/common/widgets/custom_text_field.dart';
import 'package:device_guard/common/widgets/custom_button.dart';

class CreateProfileScreen extends StatefulWidget {
  const CreateProfileScreen({super.key});

  @override
  State<CreateProfileScreen> createState() => _CreateProfileScreenState();
}

class _CreateProfileScreenState extends State<CreateProfileScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  String? _selectedAvatar;

  // List of avatar images (you can replace these with your actual image paths)
  final List<String> _avatarImages = [
    'assets/images/avatar1.png',
    'assets/images/avatar2.png',
    'assets/images/avatar3.png',
    'assets/images/avatar4.png',
    'assets/images/avatar5.png',
    'assets/images/avatar6.png',
    'assets/images/avatar7.png',
    'assets/images/avatar8.png',
  ];

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  void _onAvatarSelected(String imagePath) {
    setState(() {
      _selectedAvatar = imagePath;
    });
  }

  void _onConfirmPressed() {
    // Validate inputs
    if (_nameController.text.trim().isEmpty) {
      _showSnackBar('Please enter your name');
      return;
    }

    if (_ageController.text.trim().isEmpty) {
      _showSnackBar('Please enter your age');
      return;
    }

    if (_selectedAvatar == null) {
      _showSnackBar('Please select an avatar');
      return;
    }

    // Process the data
    final profileData = {
      'name': _nameController.text.trim(),
      'age': _ageController.text.trim(),
      'avatar': _selectedAvatar,
    };

    // Navigate to next screen or save data
    print('Profile Data: $profileData');

    // Example navigation
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => NextScreen(data: profileData)),
    // );
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppColors.primaryColor,
            size: 20.w,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Create Profile',
          style: GoogleFontStyles.h3(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Name TextField
            Text(
              'Name',
              style: GoogleFontStyles.h4(
                color: AppColors.primaryColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 8.h),
            CustomTextField(
              controller: _nameController,
              hintText: 'Enter your name',
              keyboardType: TextInputType.text,
            ),

            SizedBox(height: 24.h),

            // Age TextField
            Text(
              'Age',
              style: GoogleFontStyles.h4(
                color: AppColors.primaryColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 8.h),
            CustomTextField(
              controller: _ageController,
              hintText: 'Enter your age',
              keyboardType: TextInputType.number,
            ),

            SizedBox(height: 32.h),

            // Avatar Selection
            Text(
              'Choose Avatar',
              style: GoogleFontStyles.h4(
                color: AppColors.primaryColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 16.h),

            // Selected Avatar Display Container
            if (_selectedAvatar != null) ...[
              Container(
                width: double.infinity,
                height: 120.h,
                margin: EdgeInsets.only(bottom: 20.h),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(
                    color: AppColors.primaryColor,
                    width: 2,
                  ),
                  boxShadow: [GoogleFontStyles.boxShadow],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.r),
                      child: Image.asset(
                        _selectedAvatar!,
                        width: 60.w,
                        height: 60.w,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            width: 60.w,
                            height: 60.w,
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Icon(
                              Icons.person,
                              color: AppColors.primaryColor,
                              size: 30.w,
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'Selected Avatar',
                      style: GoogleFontStyles.h5(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],

            // Avatar Grid
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12.r),
                boxShadow: [GoogleFontStyles.boxShadow],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Select from options:',
                    style: GoogleFontStyles.h5(
                      color: AppColors.blue,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 12.w,
                      mainAxisSpacing: 12.h,
                      childAspectRatio: 1,
                    ),
                    itemCount: _avatarImages.length,
                    itemBuilder: (context, index) {
                      final imagePath = _avatarImages[index];
                      final isSelected = _selectedAvatar == imagePath;

                      return GestureDetector(
                        onTap: () => _onAvatarSelected(imagePath),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.r),
                            border: Border.all(
                              color: isSelected
                                  ? AppColors.primaryColor
                                  : AppColors.borderColor,
                              width: isSelected ? 2 : 1,
                            ),
                            color: isSelected
                                ? AppColors.primaryColor.withOpacity(0.1)
                                : AppColors.white,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(11.r),
                            child: Image.asset(
                              imagePath,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.grey.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(11.r),
                                  ),
                                  child: Icon(
                                    Icons.person,
                                    color: AppColors.grey,
                                    size: 20.w,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),

            SizedBox(height: 40.h),

            // Confirm Button
            CustomButton(
              text: 'Confirm',
              onTap: _onConfirmPressed,
            ),

            SizedBox(height: 20.h), // Bottom padding
          ],
        ),
      ),
    );
  }
}