import 'package:flutter/material.dart';
import 'package:se7ety/components/buttons/main_button.dart';
import 'package:se7ety/core/extensions/navigation.dart';
import 'package:se7ety/core/routers/routers.dart';
import 'package:se7ety/core/utils/app_colors.dart';
import 'package:se7ety/core/utils/text_styles.dart';
import 'package:se7ety/features/auth/data/models/doctor_model.dart';
import 'package:se7ety/features/patient/search/widgets/item_tile.dart';
import 'package:se7ety/features/patient/search/widgets/phone_tile.dart';

class DoctorProfile extends StatefulWidget {
  final DoctorModel? doctorModel;

  const DoctorProfile({super.key, this.doctorModel});
  @override
  State<DoctorProfile> createState() => _DoctorProfileState();
}

class _DoctorProfileState extends State<DoctorProfile> {
  late DoctorModel doctor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: AppColors.white,
        title: Text(
          'بيانات الدكتور',
          style: getTitleStyle(color: AppColors.white),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(right: 10),
          child: IconButton(
            splashRadius: 25,
            icon: const Icon(Icons.arrow_back_ios, color: AppColors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              // ------------ Header ---------------
              Row(
                children: [
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundColor: AppColors.white,
                        child: CircleAvatar(
                          backgroundColor: AppColors.white,
                          radius: 60,
                          backgroundImage: (widget.doctorModel?.image != null)
                              ? NetworkImage(widget.doctorModel!.image!)
                              : const AssetImage('assets/doc.png'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 30),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "د. ${widget.doctorModel?.name ?? ''}",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: getTitleStyle(),
                        ),
                        Text(
                          widget.doctorModel?.specialization ?? '',
                          style: getBodyStyle(),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Text(
                              widget.doctorModel?.rating.toString() ?? '0.0',
                              style: getBodyStyle(),
                            ),
                            const SizedBox(width: 3),
                            const Icon(
                              Icons.star_rounded,
                              size: 20,
                              color: Colors.orange,
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            IconTile(
                              onTap: () {},
                              backColor: AppColors.accentColor,
                              imgAssetPath: Icons.phone,
                              num: '1',
                            ),
                            if (widget.doctorModel?.phone2 != null)
                              IconTile(
                                onTap: () {},
                                backColor: AppColors.accentColor,
                                imgAssetPath: Icons.phone,
                                num: '2',
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              Text(
                "نبذه تعريفية",
                style: getBodyStyle(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.doctorModel?.bio ?? '',
                      style: getSmallStyle(),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(15),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.accentColor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TileWidget(
                      text:
                          '${widget.doctorModel?.openHour} - ${widget.doctorModel?.closeHour}',
                      icon: Icons.watch_later_outlined,
                    ),
                    const SizedBox(height: 15),
                    TileWidget(
                      text: widget.doctorModel?.address ?? '',
                      icon: Icons.location_on_rounded,
                    ),
                  ],
                ),
              ),
              const Divider(),
              const SizedBox(height: 20),
              Text(
                "معلومات الاتصال",
                style: getBodyStyle(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(15),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.accentColor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TileWidget(
                      text: widget.doctorModel?.email ?? '',
                      icon: Icons.email,
                    ),
                    const SizedBox(height: 15),
                    TileWidget(
                      text: widget.doctorModel?.phone1 ?? '',
                      icon: Icons.call,
                    ),
                    const SizedBox(height: 15),
                    if (widget.doctorModel?.phone2 != null)
                      TileWidget(
                        text: widget.doctorModel?.phone2 ?? '',
                        icon: Icons.call,
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: MainButton(
            text: 'احجز موعد الان',
            onPressed: () {
              context.pushTo(Routes.bookAppointment, extra: widget.doctorModel);
            },
          ),
        ),
      ),
    );
  }
}
