// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vax_care_healthcare_provider/app_constants/app_colors.dart';

import 'package:vax_care_healthcare_provider/app_modules/appointment_details_module/bloc/booking_details_bloc/booking_details_bloc.dart';
import 'package:vax_care_healthcare_provider/app_modules/appointment_details_module/bloc/vaccinate_child_bloc/vaccinate_child_bloc.dart';
import 'package:vax_care_healthcare_provider/app_modules/home_page_module/bloc/booking_today_bloc/bookings_today_bloc.dart';
import 'package:vax_care_healthcare_provider/app_modules/home_page_module/bloc/hospital_name_bloc/hospital_name_bloc.dart';
import 'package:vax_care_healthcare_provider/app_modules/home_page_module/bloc/parent_data_bloc/profile_data_bloc.dart';
import 'package:vax_care_healthcare_provider/app_modules/home_page_module/view/home_screen.dart';
import 'package:vax_care_healthcare_provider/app_modules/introduction_screen_module/view/introduction_screen.dart';
import 'package:vax_care_healthcare_provider/app_modules/login_module/bloc/login_bloc.dart';
import 'package:vax_care_healthcare_provider/app_modules/login_module/view/login_screen.dart';
import 'package:vax_care_healthcare_provider/app_modules/vaccine_history_module/hospital_vaccine_history_bloc/hospital_vaccine_history_bloc.dart';
import 'package:vax_care_healthcare_provider/app_modules/vaccine_stock_module/bloc/request_stock_bloc/request_stock_bloc.dart';
import 'package:vax_care_healthcare_provider/app_modules/vaccine_stock_module/bloc/vaccine_stock_bloc/vaccine_stock_bloc.dart';
import 'package:vax_care_healthcare_provider/app_utils/app_localstorage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool isFirstLaunch = await AppLocalstorage.getIntroScreenStatus();
  bool isLoggedIn = await AppLocalstorage.getLoginStatus();

  Widget initialScreen;

  if (isFirstLaunch) {
    initialScreen = const IntroductionScreen();
  } else {
    if (isLoggedIn) {
      initialScreen = const HomeScreen();
    } else {
      initialScreen = const LoginScreen();
    }
  }
  runApp(MyApp(
    initialScreen: initialScreen,
  ));
}

class MyApp extends StatelessWidget {
  final Widget initialScreen;
  const MyApp({
    super.key,
    required this.initialScreen,
  });

  // Add a global navigator key
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginBloc(),
        ),
        BlocProvider(
          create: (context) => ProfileDataBloc(),
        ),
        BlocProvider(
          create: (context) => BookingsTodayBloc(),
        ),
        BlocProvider(
          create: (context) => BookingDetailsBloc(),
        ),
        BlocProvider(
          create: (context) => HospitalVaccineHistoryBloc(),
        ),
        BlocProvider(
          create: (context) => VaccineStockBloc(),
        ),
        BlocProvider(
          create: (context) => RequestStockBloc(),
        ),
        BlocProvider(
          create: (context) => VaccinateChildBloc(),
        ),
        BlocProvider(
          create: (context) => HospitalNameBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'VaxCare Healthcare Provider',
        debugShowCheckedModeBanner: false,
        navigatorKey: navigatorKey,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.firstColor),
          useMaterial3: true,
        ),
        home: initialScreen,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
