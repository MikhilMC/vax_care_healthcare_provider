import 'package:flutter/material.dart';
import 'package:vax_care_healthcare_provider/app_constants/app_colors.dart';
import 'package:vax_care_healthcare_provider/app_modules/vaccine_stock_module/widget/display_vaccine_stock.dart';
import 'package:vax_care_healthcare_provider/app_modules/vaccine_stock_module/widget/request_stock_form.dart';

class VaccineStockScreen extends StatefulWidget {
  const VaccineStockScreen({super.key});

  @override
  State<VaccineStockScreen> createState() => _VaccineStockScreenState();
}

class _VaccineStockScreenState extends State<VaccineStockScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Vaccine Stock"),
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
        bottom: PreferredSize(
          preferredSize: Size(
            screenSize.width,
            screenSize.height * 0.05,
          ),
          child: TabBar(
            controller: _tabController,
            dividerColor: AppColors.firstColor,
            indicatorColor: AppColors.secondColor,
            indicatorSize: TabBarIndicatorSize.tab,
            labelColor: Colors.black,
            tabs: const [
              Tab(
                text: "Request Stock",
              ),
              Tab(
                text: "Display Stock",
              ),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          RequestStockForm(),
          DisplayVaccineStock(),
        ],
      ),
    );
  }
}
