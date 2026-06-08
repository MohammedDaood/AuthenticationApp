import 'package:auth_app/core/helper/extensions.dart';
import 'package:auth_app/core/routing/routes.dart';
import 'package:auth_app/core/theming/colors.dart';
import 'package:auth_app/futcer/login/screens/%20qr_scanner_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.myWhite,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(flex: 2),

              // Illustration
              SvgPicture.asset('assets/svgs/login.svg', width: 400.w, height: 400.h),

              SizedBox(height: 30.h),

              Text(
                "تسجيل الدخول",
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: ColorsManager.myBlack),
              ),
              SizedBox(height: 10.h),

              Text(
                "قم بمسح رمز الكود لتسجيل الدخول",
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.normal, color: ColorsManager.myGrey),
              ),

              const Spacer(flex: 3),

              // QR Scan Circle Button
              GestureDetector(
                onTap: () async {
                  context.pushNamed(Routes.qrScannerScreen);
                },
                child: Container(
                  width: 100.w,
                  height: 100.w,
                  decoration: BoxDecoration(
                    color: ColorsManager.myBlue,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: ColorsManager.myBlue.withOpacity(0.4),
                        blurRadius: 20,
                        spreadRadius: 4,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Icon(Icons.qr_code_scanner_rounded, size: 40.sp, color: ColorsManager.myWhite),
                ),
              ),

              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
    );
  }
}
