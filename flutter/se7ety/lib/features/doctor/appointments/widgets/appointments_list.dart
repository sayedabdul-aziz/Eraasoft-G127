import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:se7ety/core/firebase/firestore_services.dart';
import 'package:se7ety/core/utils/app_colors.dart';
import 'package:se7ety/core/utils/text_styles.dart';
import 'package:se7ety/features/patient/booking/data/appointment_model.dart';

class MyAppointmentList extends StatefulWidget {
  const MyAppointmentList({super.key});

  @override
  State<MyAppointmentList> createState() => _MyAppointmentListState();
}

class _MyAppointmentListState extends State<MyAppointmentList> {
  Future<void> deleteAppointment(String docID) {
    return FirebaseFirestore.instance
        .collection('appointments')
        .doc('appointments')
        .collection('pending')
        .doc(docID)
        .delete();
  }

  String _dateFormatter(DateTime date) {
    String formattedDate = DateFormat('dd-MM-yyyy').format(date);
    return formattedDate;
  }

  String _timeFormatter(DateTime date) {
    String formattedTime = DateFormat('hh:mm').format(date);
    return formattedTime;
  }

  void showAlertDialog(BuildContext context, String docID) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog.adaptive(
          title: const Text("حذف الحجز"),
          content: const Text("هل متاكد من حذف هذا الحجز ؟"),
          actions: [
            TextButton(
              child: const Text("لا"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text("نعم"),
              onPressed: () {
                deleteAppointment(docID);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  bool _compareDate(DateTime date) {
    if (_dateFormatter(DateTime.now()).compareTo(_dateFormatter(date)) == 0) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder(
        future: FirestoreServices.getPatientAppointment(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          log(snapshot.error.toString());
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          return snapshot.data!.docs.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/images/no_scheduled.svg',
                        width: 250,
                      ),
                      Text('لا يوجد حجوزات قادمة', style: getBodyStyle()),
                    ],
                  ),
                )
              : ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: snapshot.data?.docs.length,
                  itemBuilder: (context, index) {
                    var appointment = AppointmentModel.fromJson(
                      snapshot.data!.docs[index].data() as Map<String, dynamic>,
                    );
                    return Column(
                      children: [
                        const SizedBox(height: 15),
                        Container(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          decoration: BoxDecoration(
                            color: AppColors.accentColor,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                offset: const Offset(-3, 0),
                                blurRadius: 15,
                                color: Colors.grey.withValues(alpha: .1),
                              ),
                            ],
                          ),
                          child: Theme(
                            data: Theme.of(
                              context,
                            ).copyWith(dividerColor: Colors.transparent),
                            child: ExpansionTile(
                              childrenPadding: const EdgeInsets.symmetric(
                                vertical: 10,
                              ),
                              expandedCrossAxisAlignment:
                                  CrossAxisAlignment.end,
                              backgroundColor: AppColors.accentColor,
                              collapsedBackgroundColor: AppColors.accentColor,
                              title: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text(
                                      'د. ${appointment.doctorName}',
                                      style: getTitleStyle(),
                                    ),
                                  ),
                                ],
                              ),
                              subtitle: Padding(
                                padding: const EdgeInsets.only(top: 5, left: 5),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.calendar_month_rounded,
                                          color: AppColors.primaryColor,
                                          size: 16,
                                        ),
                                        const SizedBox(width: 10),
                                        Text(
                                          _dateFormatter(
                                            appointment.date ?? DateTime.now(),
                                          ),
                                          style: getBodyStyle(),
                                        ),
                                        const SizedBox(width: 30),
                                        Text(
                                          _compareDate(
                                                appointment.date ??
                                                    DateTime.now(),
                                              )
                                              ? "اليوم"
                                              : "",
                                          style: getBodyStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.green,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.watch_later_outlined,
                                          color: AppColors.primaryColor,
                                          size: 16,
                                        ),
                                        const SizedBox(width: 10),
                                        Text(
                                          _timeFormatter(
                                            appointment.date ?? DateTime.now(),
                                          ),
                                          style: getBodyStyle(),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: 5,
                                    right: 10,
                                    left: 16,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('اسم المريض: ${appointment.name}'),
                                      const SizedBox(height: 10),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.location_on_rounded,
                                            color: AppColors.primaryColor,
                                            size: 16,
                                          ),
                                          const SizedBox(width: 10),
                                          Text(appointment.location.toString()),
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                      SizedBox(
                                        width: double.infinity,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            foregroundColor: AppColors.white,
                                            backgroundColor: Colors.red,
                                          ),
                                          onPressed: () {
                                            showAlertDialog(
                                              context,
                                              snapshot.data!.docs[index].id,
                                            );
                                          },
                                          child: const Text('حذف الحجز'),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
        },
      ),
    );
  }
}
