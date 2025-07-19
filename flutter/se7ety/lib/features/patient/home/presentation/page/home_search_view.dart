import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:se7ety/components/cards/doctor_card.dart';
import 'package:se7ety/core/firebase/firestore_services.dart';
import 'package:se7ety/core/utils/app_colors.dart';
import 'package:se7ety/core/utils/text_styles.dart';
import 'package:se7ety/features/auth/data/models/doctor_model.dart';

class DoctorNameSearchScreen extends StatefulWidget {
  final String searchKey;
  const DoctorNameSearchScreen({super.key, required this.searchKey});

  @override
  State<DoctorNameSearchScreen> createState() => _DoctorNameSearchScreenState();
}

class _DoctorNameSearchScreenState extends State<DoctorNameSearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: AppColors.white,
        title: Text(
          'ابحث عن دكتورك',
          style: getTitleStyle(color: AppColors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: FutureBuilder(
          future: FirestoreServices.getDoctorsByName(widget.searchKey),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }
                return snapshot.data!.docs.isEmpty
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
                                'لا يوجد دكتور بهذا الاسم',
                                style: getBodyStyle(),
                              ),
                            ],
                          ),
                        ),
                      )
                    : Scrollbar(
                        child: ListView.builder(
                          itemCount: snapshot.data?.size,
                          itemBuilder: (context, index) {
                            DoctorModel doctor = DoctorModel.fromJson(
                              snapshot.data!.docs[index].data()
                                  as Map<String, dynamic>,
                            );
                            if (doctor.specialization == '') {
                              return const SizedBox();
                            }
                            return DoctorCard(doctor: doctor);
                          },
                        ),
                      );
              },
        ),
      ),
    );
  }
}
