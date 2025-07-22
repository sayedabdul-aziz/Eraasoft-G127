import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:se7ety/components/buttons/main_button.dart';
import 'package:se7ety/components/cards/doctor_card.dart';
import 'package:se7ety/components/dialogs/loading_dialog.dart';
import 'package:se7ety/core/firebase/firestore_services.dart';
import 'package:se7ety/core/services/shared_pref.dart';
import 'package:se7ety/core/utils/app_colors.dart';
import 'package:se7ety/core/utils/text_styles.dart';
import 'package:se7ety/features/auth/data/models/doctor_model.dart';
import 'package:se7ety/features/patient/booking/data/appointment_model.dart';
import 'package:se7ety/features/patient/booking/data/available_appointments.dart';

class BookAppointmentScreen extends StatefulWidget {
  final DoctorModel doctor;

  const BookAppointmentScreen({super.key, required this.doctor});

  @override
  State<BookAppointmentScreen> createState() => _BookAppointmentScreenState();
}

class _BookAppointmentScreenState extends State<BookAppointmentScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  String? dateUTC;
  String? bookingHour;

  int selectedSlot = -1;

  // هتشيل الساعات المتاحه بتاعت اليوم اللي هنحدده
  List<int> times = [];

  Future<void> getAvailableTimes(DateTime selectedDate) async {
    times = getAvailableAppointments(
      selectedDate,
      widget.doctor.openHour ?? "0",
      widget.doctor.closeHour ?? "0",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: AppColors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: AppColors.white,
          ),
        ),
        elevation: 0,
        title: Text(
          'احجز مع دكتورك',
          style: getTitleStyle(color: AppColors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              DoctorCard(doctor: widget.doctor, isClickable: false),
              const SizedBox(height: 10),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Text('-- ادخل بيانات الحجز --', style: getTitleStyle()),
                    const SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            'اسم المريض',
                            style: getBodyStyle(color: AppColors.darkColor),
                          ),
                        ],
                      ),
                    ),
                    TextFormField(
                      controller: _nameController,
                      validator: (value) {
                        if (value!.isEmpty) return 'من فضلك ادخل اسم المريض';
                        return null;
                      },
                      style: getBodyStyle(),
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(height: 7),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            'رقم الهاتف',
                            style: getBodyStyle(color: AppColors.darkColor),
                          ),
                        ],
                      ),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.phone,
                      controller: _phoneController,
                      style: getBodyStyle(),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'من فضلك ادخل رقم الهاتف';
                        } else if (value.length < 10) {
                          return 'يرجي ادخال رقم هاتف صحيح';
                        }
                        return null;
                      },
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(height: 7),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            'وصف الحاله',
                            style: getBodyStyle(color: AppColors.darkColor),
                          ),
                        ],
                      ),
                    ),
                    TextFormField(
                      controller: _descriptionController,
                      keyboardType: TextInputType.multiline,
                      maxLines: 5,
                      style: getBodyStyle(),
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(height: 7),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            'تاريخ الحجز',
                            style: getBodyStyle(color: AppColors.darkColor),
                          ),
                        ],
                      ),
                    ),
                    TextFormField(
                      readOnly: true,
                      onTap: () {
                        selectDate(context);
                      },
                      controller: _dateController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'من فضلك ادخل تاريخ الحجز';
                        }
                        return null;
                      },
                      textInputAction: TextInputAction.next,
                      style: getBodyStyle(),
                      decoration: const InputDecoration(
                        hintText: 'ادخل تاريخ الحجز',
                        suffixIcon: Padding(
                          padding: EdgeInsets.all(4.0),
                          child: CircleAvatar(
                            backgroundColor: AppColors.primaryColor,
                            radius: 18,
                            child: Icon(
                              Icons.date_range_outlined,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 7),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            'وقت الحجز',
                            style: getBodyStyle(color: AppColors.darkColor),
                          ),
                        ],
                      ),
                    ),
                    Wrap(
                      spacing: 8.0,
                      children: times.map((hour) {
                        return ChoiceChip(
                          backgroundColor: AppColors.accentColor,
                          // showCheckmark: false,
                          checkmarkColor: AppColors.white,
                          // avatar: const Icon(Icons.abc),
                          selectedColor: AppColors.primaryColor,
                          label: Text(
                            '${(hour < 10) ? '0' : ''}${hour.toString()}:00',
                            style: TextStyle(
                              color: hour == selectedSlot
                                  ? AppColors.white
                                  : AppColors.darkColor,
                            ),
                          ),
                          selected: hour == selectedSlot,
                          onSelected: (selected) {
                            setState(() {
                              selectedSlot = hour;
                              bookingHour =
                                  '${(hour < 10) ? '0' : ''}${hour.toString()}:00'; // to send to firebase(hh:mm)
                            });
                          },
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 10, 12, 0),
          child: MainButton(
            text: 'تأكيد الحجز',
            onPressed: () async {
              if (_formKey.currentState!.validate() && selectedSlot != -1) {
                await FirestoreServices.createAppointment(
                  AppointmentModel(
                    patientID: SharedPref.getUserId(),
                    doctorID: widget.doctor.uid,
                    name: _nameController.text,
                    phone: _phoneController.text,
                    description: _descriptionController.text,
                    doctorName: widget.doctor.name,
                    location: widget.doctor.address,
                    date: DateTime.parse('$dateUTC $bookingHour:00'),
                    isComplete: false,
                    rating: null,
                  ),
                );
                showAlertDialog(context);
              }
            },
          ),
        ),
      ),
    );
  }

  Future<void> selectDate(BuildContext context) async {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    ).then((date) {
      if (date != null) {
        setState(() {
          _dateController.text = DateFormat(
            'dd-MM-yyyy',
          ).format(date); // to display the date in the text field
          dateUTC = DateFormat(
            'yyyy-MM-dd',
          ).format(date); // to send the date to firebase
          getAvailableTimes(date); // to get available times
        });
      }
    });
  }
}
