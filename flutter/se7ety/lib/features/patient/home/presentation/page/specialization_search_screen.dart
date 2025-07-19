import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:se7ety/components/cards/doctor_card.dart';
import 'package:se7ety/core/firebase/firestore_services.dart';
import 'package:se7ety/core/utils/app_colors.dart';
import 'package:se7ety/core/utils/text_styles.dart';
import 'package:se7ety/features/auth/data/models/doctor_model.dart';

class SpecializationSearchScreen extends StatefulWidget {
  final String specialization;
  const SpecializationSearchScreen({super.key, required this.specialization});

  @override
  State<SpecializationSearchScreen> createState() =>
      _SpecializationSearchScreenState();
}

class _SpecializationSearchScreenState
    extends State<SpecializationSearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColors.white,
        backgroundColor: AppColors.primaryColor,
        title: Text(
          widget.specialization,
          style: getTitleStyle(color: AppColors.white),
        ),
      ),
      body: FutureBuilder(
        future: FirestoreServices.getDoctorsBySpecialization(
          widget.specialization,
        ),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          return snapshot.data?.docs.isEmpty == true
              ? Center(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/images/no-search.svg',
                          width: 250,
                        ),
                        Text(
                          'لا يوجد دكتور بهذا التخصص حاليا',
                          style: getBodyStyle(),
                        ),
                      ],
                    ),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.all(15),
                  child: ListView.builder(
                    physics: const ClampingScrollPhysics(),
                    itemCount: snapshot.data?.docs.length,
                    itemBuilder: (context, index) {
                      DoctorModel doctor = DoctorModel.fromJson(
                        snapshot.data!.docs[index].data()
                            as Map<String, dynamic>,
                      );
                      if (doctor.specialization == '' ||
                          doctor.specialization == null) {
                        return const SizedBox();
                      }
                      return DoctorCard(doctor: doctor);
                    },
                  ),
                );
        },
      ),
    );
  }
}
