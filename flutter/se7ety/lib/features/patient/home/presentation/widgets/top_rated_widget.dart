import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:se7ety/components/cards/doctor_card.dart';
import 'package:se7ety/core/firebase/firestore_services.dart';
import 'package:se7ety/features/auth/data/models/doctor_model.dart';

// Firestore (Database)
// collection => List of documents , document => (id , data {})

// How it Works ?
// 1) need specific document (ex : profile)  => Collection + doc Id
// 2) need list of documents (ex : doctors) => Collection
// 3) need list of documents with specific condition (ex : doctors with rating > 4)
//    => Collection + condition
// for sorting => orderBy
// for filtering and matching => where
// for searching => startAt + endAt
// for pagination => limit + startAfter

class TopRatedList extends StatefulWidget {
  const TopRatedList({super.key});

  @override
  State<TopRatedList> createState() => _TopRatedListState();
}

class _TopRatedListState extends State<TopRatedList> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder(
        future: FirestoreServices.sortDoctorsByRating(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(
                value: .9,
                color: Colors.black12,
              ),
            );
          } else {
            return ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: snapshot.data?.docs.length,
              itemBuilder: (context, index) {
                DoctorModel doctor = DoctorModel.fromJson(
                  snapshot.data?.docs[index].data() as Map<String, dynamic>,
                );
                if (doctor.specialization == null ||
                    doctor.specialization?.isEmpty == true) {
                  return const SizedBox();
                }
                return DoctorCard(doctor: doctor);
              },
            );
          }
        },
      ),
    );
  }
}
