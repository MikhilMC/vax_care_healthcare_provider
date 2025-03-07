import 'package:flutter/material.dart';
import 'package:vax_care_healthcare_provider/app_modules/appointment_details_module/widget/appointment_form.dart';
import 'package:vax_care_healthcare_provider/app_modules/appointment_details_module/widget/child_details_card.dart';
import 'package:vax_care_healthcare_provider/app_modules/home_page_module/view/home_screen.dart';

class AppointmentDetailsScreen extends StatefulWidget {
  final Map<String, String> appointment;
  final List<String> vaccines;

  const AppointmentDetailsScreen(
      {super.key, required this.appointment, required this.vaccines});

  @override
  State<AppointmentDetailsScreen> createState() =>
      _AppointmentDetailsScreenState();
}

class _AppointmentDetailsScreenState extends State<AppointmentDetailsScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final Map<String, bool> vaccineChecks = {};

  @override
  void initState() {
    super.initState();
    for (var vaccine in widget.vaccines) {
      vaccineChecks.putIfAbsent(vaccine, () => false);
    }
  }

  @override
  void dispose() {
    _heightController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  bool get _didallVaccinesComplete {
    bool allChecked = vaccineChecks.values.every((checked) => checked);
    return allChecked;
  }

  void _vaccinate() {
    FocusScope.of(context).unfocus();
    if (_formKey.currentState!.validate() && _didallVaccinesComplete) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Child vaccinated successfully',
          ),
        ),
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text("Appointment"),
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 35,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenSize.width * 0.05,
          vertical: screenSize.height * 0.01,
        ),
        child: CustomScrollView(
          slivers: [
            ChildDetailsCard(appointment: widget.appointment),
            SliverToBoxAdapter(
              child: SizedBox(
                height: screenSize.height * 0.05,
              ),
            ),
            SliverList.builder(
              itemBuilder: (context, index) {
                return Card(
                  elevation: 2,
                  child: CheckboxListTile(
                    title: Text(widget.vaccines[index]),
                    value: vaccineChecks[widget.vaccines[index]] ?? false,
                    onChanged: (bool? value) {
                      setState(() {
                        vaccineChecks[widget.vaccines[index]] = value ?? false;
                      });
                    },
                  ),
                );
              },
              itemCount: widget.vaccines.length,
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: screenSize.height * 0.05,
              ),
            ),
            AppointmentForm(
              formKey: _formKey,
              heightController: _heightController,
              weightController: _weightController,
              onSubmitted: _vaccinate,
            ),
          ],
        ),
      ),
    );
  }
}
/**
 * SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: IntrinsicHeight(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Child: ${widget.appointment['childName']}",
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      "Parent: ${widget.appointment['parentName']}",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      "Slot: ${widget.appointment['slot']}",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Vaccines Administered",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(
                      child: ListView(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          ...widget.vaccines.map((vaccine) {
                            return CheckboxListTile(
                              title: Text(vaccine),
                              value: vaccineChecks[vaccine] ?? false,
                              onChanged: (bool? value) {
                                setState(() {
                                  vaccineChecks[vaccine] = value ?? false;
                                });
                              },
                            );
                          }),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: heightController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: "Height (cm)",
                          border: OutlineInputBorder()),
                      onChanged: (value) => setState(() {}),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: weightController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: "Weight (kg)",
                          border: OutlineInputBorder()),
                      onChanged: (value) => setState(() {}),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: isFormValid ? () {} : null,
                      child: Text("Submit"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      )
 */
