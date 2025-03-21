import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:vax_care_healthcare_provider/app_constants/app_colors.dart';
import 'package:vax_care_healthcare_provider/app_modules/vaccine_stock_module/bloc/vaccine_stock_bloc/vaccine_stock_bloc.dart';
import 'package:vax_care_healthcare_provider/app_modules/vaccine_stock_module/widget/vaccine_stock_card.dart';
import 'package:vax_care_healthcare_provider/app_widgets/custom_error_widget.dart';
import 'package:vax_care_healthcare_provider/app_widgets/empty_list.dart';

class DisplayVaccineStock extends StatefulWidget {
  const DisplayVaccineStock({super.key});

  // List of vaccines with name, description, and age group

  @override
  State<DisplayVaccineStock> createState() => _DisplayVaccineStockState();
}

class _DisplayVaccineStockState extends State<DisplayVaccineStock> {
  @override
  void initState() {
    super.initState();
    context
        .read<VaccineStockBloc>()
        .add(VaccineStockEvent.vaccineStockFetched());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VaccineStockBloc, VaccineStockState>(
      builder: (context, state) {
        if (state is VaccineStockError) {
          return CustomErrorWidget(
            errorMessage: state.errorMessage,
          );
        }

        if (state is VaccineStockEmpty) {
          return EmptyList(
            message: "No Vaccines available",
          );
        }

        if (state is! VaccineStockSuccess) {
          return Center(
            child: CircularProgressIndicator(
              color: AppColors.firstColor,
            ),
          );
        }

        final vaccineStock = state.vaccineStock;

        return ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: vaccineStock.length,
          itemBuilder: (context, index) {
            final vaccine = vaccineStock[index];
            return VaccineStockCard(
              vaccineStock: vaccine,
            );
          },
        );
      },
    );
  }
}
