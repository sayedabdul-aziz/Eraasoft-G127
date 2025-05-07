import 'package:doctor_profile_ui/widgets/call_widget.dart';
import 'package:flutter/material.dart';

class DoctorHeader extends StatelessWidget {
  const DoctorHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipOval(
          child: Image.network(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSleborUKlDqo2xbo3qSyXDV1Fs8B-4M9v6og&s',
            width: 150,
            height: 150,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 16),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Dr. Ahmed Tarek',
              style: TextStyle(
                  fontWeight: FontWeight.w600, color: Colors.indigo),
            ),
            SizedBox(height: 5),
            Text('Dentist'),
            SizedBox(height: 5),
            Row(
              children: [
                Icon(Icons.star_rounded, color: Colors.amber),
                Text('4.9')
              ],
            ),
            SizedBox(height: 5),
            Row(
              children: [
                CallWidget(number: '1'),
                SizedBox(width: 8),
                CallWidget(number: '2'),
              ],
            ),
          ],
        )
      ],
    );
  }
}
