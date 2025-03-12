import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vax_care_healthcare_provider/app_modules/appointment_details_module/bloc/booking_details_bloc/booking_details_bloc.dart';
import 'package:vax_care_healthcare_provider/app_modules/home_page_module/bloc/booking_today_bloc/bookings_today_bloc.dart';
import 'package:vax_care_healthcare_provider/app_modules/home_page_module/bloc/parent_data_bloc/profile_data_bloc.dart';
import 'package:vax_care_healthcare_provider/app_modules/introduction_screen_module/view/introduction_screen.dart';
import 'package:vax_care_healthcare_provider/app_modules/login_module/bloc/login_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
      ],
      child: MaterialApp(
        title: 'VaxCare Healthcare Provider',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const IntroductionScreen(),
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
