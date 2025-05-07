import 'package:doctor_profile_ui/widgets/detail_item.dart';
import 'package:flutter/material.dart';

class ContactsWidget extends StatelessWidget {
  const ContactsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Contact Details',
            style: TextStyle(fontWeight: FontWeight.w600)),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Column(
            children: [
              DetailItem(
                title: 'ahmed@gmail.com',
                icon: Icons.email,
              ),
              SizedBox(height: 6),
              DetailItem(
                title: '0101010100111',
                icon: Icons.call,
              ),
              SizedBox(height: 6),
              DetailItem(
                title: '0101010100111',
                icon: Icons.call,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
