import 'package:doctor_profile_ui/widgets/detail_item.dart';
import 'package:flutter/material.dart';

class AddressWidget extends StatelessWidget {
  const AddressWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Column(
        children: [
          DetailItem(
            title: 'Cairo Hospital',
            icon: Icons.local_hospital,
          ),
          SizedBox(height: 6),
          DetailItem(
            title: '10:00 AM - 11:00 PM',
            icon: Icons.watch_later_outlined,
          ),
          SizedBox(height: 6),
          DetailItem(
            title: 'Cairo, Egypt',
            icon: Icons.location_on,
          ),
        ],
      ),
    );
  }
}
