// lib/screens/onboarding_screen.dart
import 'package:auth_app/helper/shered_Pref.dart';
import 'package:auth_app/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingModel> _onboardingPages = [
    OnboardingModel(
      title: 'أمان أقوى معنا',
      description: 'احصل على حماية متقدمة لبياناتك الشخصية',
      image: SvgPicture.asset('assets/images/firstimage.svg', width: 300, height: 300),
    ),
    OnboardingModel(
      title: ' أعداد سهل وبسيط باستخدام كاميرتك',
      description: ' سوف تقوم بمسح كود لتسجيل الدخول بسرعة باستخدام كاميرتك',
      image: SvgPicture.asset('assets/images/Secondimage.svg', width: 300, height: 300),
    ),
    OnboardingModel(
      title: 'رمز فريد يستخدم لتسجيل الدخول',
      description: 'عند استدخدامك للتحقق بخطوتين سوف تقوم بادخال كلمة مرورك ورمز من هذا التطبيق',
      image: SvgPicture.asset('assets/images/Thirdimage.svg', width: 300, height: 300),
    ),
  ];

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  Future<void> _onGetStarted() async {
    await PrefUtils.setOnboardingCompleted();

    if (!mounted) return;

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, Color(0xFFF5F5F5)],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // PageView
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: _onPageChanged,
                  itemCount: _onboardingPages.length,
                  itemBuilder: (context, index) {
                    return OnboardingPageContent(model: _onboardingPages[index]);
                  },
                ),
              ),

              // Page Indicator and Button
              Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  children: [
                    SmoothPageIndicator(
                      controller: _pageController,
                      count: _onboardingPages.length,
                      effect: const WormEffect(
                        dotHeight: 10,
                        dotWidth: 10,
                        activeDotColor: Colors.blue,
                        dotColor: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 30),

                    if (_currentPage == _onboardingPages.length - 1)
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: _onGetStarted,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                          ),
                          child: const Text('ابدأ الآن', style: TextStyle(fontSize: 18)),
                        ),
                      )
                    else
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(width: 60),
                          ElevatedButton(
                            onPressed: () {
                              _pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                            ),
                            child: const Text('التالي'),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OnboardingModel {
  final String title;
  final String description;
  final Widget image;

  OnboardingModel({required this.title, required this.description, required this.image});
}

// Individual page widget
class OnboardingPageContent extends StatelessWidget {
  final OnboardingModel model;

  const OnboardingPageContent({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(padding: const EdgeInsets.all(30), child: model.image),
        const SizedBox(height: 40),
        Text(
          model.title,
          style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Text(
            model.description,
            style: const TextStyle(fontSize: 16, color: Colors.grey),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
