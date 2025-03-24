import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vax_care_healthcare_provider/app_constants/app_colors.dart';
import 'package:vax_care_healthcare_provider/app_modules/home_page_module/bloc/hospital_name_bloc/hospital_name_bloc.dart';
import 'package:vax_care_healthcare_provider/app_modules/home_page_module/widget/booking_today_widget.dart';
import 'package:vax_care_healthcare_provider/app_modules/home_page_module/widget/profile_page_widget.dart';
import 'package:vax_care_healthcare_provider/app_modules/login_module/view/login_screen.dart';
import 'package:vax_care_healthcare_provider/app_modules/vaccine_history_module/view/vaccine_history_screen.dart';
import 'package:vax_care_healthcare_provider/app_modules/vaccine_stock_module/view/vaccine_stock_screen.dart';
import 'package:vax_care_healthcare_provider/app_utils/app_localstorage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentPageIndex = 0;

  final PageController _pageController = PageController();

  late List<Widget> _appBodies;

  @override
  void initState() {
    _appBodies = [
      Center(
        child: BookingTodayWidget(),
      ),
      Center(child: ProfilePageWidget()),
    ];
    super.initState();
    context
        .read<HospitalNameBloc>()
        .add(HospitalNameEvent.hospitalNameFetched());
  }

  Future<void> _logout() async {
    await AppLocalstorage.hospitalLogout();
    if (mounted) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<HospitalNameBloc, HospitalNameState>(
          builder: (context, state) {
            if (state is HospitalNameError) {
              return Text("Error: ${state.errorMessage}");
            }

            if (state is! HospitalNameSuccess) {
              return const Text("Loading...");
            }
            return Text(state.hospitalName);
          },
        ),
        titleTextStyle: const TextStyle(
          color: AppColors.firstColor,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: AppColors.secondColor,
          backgroundColor: AppColors.thirdColor,
          iconTheme: WidgetStateProperty.resolveWith<IconThemeData?>(
            (states) {
              if (states.contains(WidgetState.selected)) {
                return IconThemeData(
                  color: AppColors.thirdColor,
                ); // Icon color for selected item
              }
              return IconThemeData(
                color: AppColors.firstColor,
              ); // Icon color for unselected items
            },
          ),
          labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>(
            (states) {
              if (states.contains(WidgetState.selected)) {
                return TextStyle(
                  color: AppColors.firstColor, // Text color for selected item
                  fontWeight: FontWeight.bold,
                );
              }
              return const TextStyle(
                color: Colors.black, // Text color for unselected items
                fontWeight: FontWeight.normal,
              );
            },
          ),
        ),
        child: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              _currentPageIndex = index;
            });
            _pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
            );
          },
          selectedIndex: _currentPageIndex,
          // labelBehavior: ,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.vaccines),
              label: "Booking",
            ),
            NavigationDestination(
              icon: Icon(Icons.person),
              label: "Profile",
            ),
          ],
        ),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentPageIndex = index;
          });
        },
        children: _appBodies,
      ),
      drawer: Drawer(
        backgroundColor: AppColors.thirdColor,
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: AppColors.firstColor,
              ),
              child: Text(
                'VaxCare',
                style: TextStyle(
                  color: AppColors.thirdColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.history,
                color: AppColors.firstColor,
              ),
              title: const Text(
                'Vaccine History',
                style: TextStyle(
                  color: AppColors.firstColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => VaccineHistoryScreen(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(
                Icons.inventory,
                color: AppColors.firstColor,
              ),
              title: const Text(
                'Vaccine Stock',
                style: TextStyle(
                  color: AppColors.firstColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => VaccineStockScreen(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.logout,
                color: AppColors.firstColor,
              ),
              title: const Text(
                'LogOut',
                style: TextStyle(
                  color: AppColors.firstColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              onTap: _logout,
            ),
          ],
        ),
      ),
    );
  }
}
