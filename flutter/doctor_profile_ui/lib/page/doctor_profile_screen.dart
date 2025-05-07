import 'package:doctor_profile_ui/widgets/address_widget.dart';
import 'package:doctor_profile_ui/widgets/contacts_widget.dart';
import 'package:doctor_profile_ui/widgets/doctor_header.dart';
import 'package:doctor_profile_ui/widgets/main_button.dart';
import 'package:flutter/material.dart';

class DoctorProfileScreen extends StatelessWidget {
  const DoctorProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        centerTitle: true,
        title: const Text(
          "Doctor Profile",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const DoctorHeader(),
              const SizedBox(height: 20),
              const Text('About',
                  style: TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(height: 10),
              const Text(
                  'Former Bachelors in Dentistry at the University of London at the University of London at the University of London.'),
              const SizedBox(height: 20),
              const AddressWidget(),
              const SizedBox(height: 10),
              const Divider(),
              const ContactsWidget(),
              const SizedBox(height: 20),
              MainButton(
                text: 'Call Now',
                bgColor: Colors.green,
                onPressed: () {},
              ),
              const SizedBox(height: 10),
              MainButton(
                text: 'Book Appointment',
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
