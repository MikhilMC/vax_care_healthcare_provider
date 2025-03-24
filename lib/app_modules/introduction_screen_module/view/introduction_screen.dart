import 'package:flutter/material.dart';
import 'package:vax_care_healthcare_provider/app_constants/app_colors.dart';
import 'package:vax_care_healthcare_provider/app_modules/introduction_screen_module/model/onboarding_page_model.dart';
import 'package:vax_care_healthcare_provider/app_modules/introduction_screen_module/widget/onboarding_page_presenter.dart';
import 'package:vax_care_healthcare_provider/app_modules/login_module/view/login_screen.dart';
import 'package:vax_care_healthcare_provider/app_utils/app_localstorage.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({super.key});

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  Future<void> _navigate() async {
    await AppLocalstorage.disableIntroScreen();
    if (mounted) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnboardingPagePresenter(
        pages: [
          OnboardingPageModel(
            title: 'Streamlined Vaccination Workflow',
            description:
                'Manage and administer children\'s vaccinations efficiently with a structured system.',
            imageUrl: 'assets/images/onboarding_image_1.png',
            bgColor: AppColors.onBoardingPage1Color,
            textColor: Colors.white,
            isLightBackground: true,
          ),
          OnboardingPageModel(
            title: 'Comprehensive Patient Records',
            description:
                'Maintain accurate and up-to-date vaccination records for all registered children.',
            imageUrl: 'assets/images/onboarding_image_2.png',
            bgColor: AppColors.onBoardingPage2Color,
            textColor: Colors.white,
            isLightBackground: true,
          ),
          OnboardingPageModel(
            title: 'Efficient Appointment Scheduling',
            description:
                'Organize and manage vaccination appointments seamlessly within your hospital.',
            imageUrl: 'assets/images/onboarding_image_3.png',
            bgColor: AppColors.onBoardingPage3Color,
            textColor: Colors.white,
            isLightBackground: false,
          ),
          OnboardingPageModel(
            title: 'Automated Reminders & Reports',
            description:
                'Get timely alerts and generate reports to ensure smooth vaccination operations.',
            imageUrl: 'assets/images/onboarding_image_4.png',
            bgColor: AppColors.onBoardingPage4Color,
            textColor: Colors.white,
            isLightBackground: true,
          ),
        ],
        onSkip: _navigate,
        onFinish: _navigate,
      ),
    );
  }
}
