// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ChildDetailsCard extends StatelessWidget {
  final Map<String, String> appointment;
  const ChildDetailsCard({
    super.key,
    required this.appointment,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return SliverToBoxAdapter(
      child: Card(
        elevation: 2,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenSize.width * 0.05,
            vertical: screenSize.height * 0.01,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Child Details",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: screenSize.height * 0.01,
              ),
              Text(
                "Child: ${appointment['childName']}",
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                height: screenSize.height * 0.01,
              ),
              Text(
                "Parent: ${appointment['parentName']}",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: screenSize.height * 0.01,
              ),
              Text(
                "Slot: ${appointment['slot']}",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
