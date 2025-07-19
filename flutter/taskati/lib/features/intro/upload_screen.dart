import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati/core/constants/app_images.dart';
import 'package:taskati/core/functions/dialogs.dart';
import 'package:taskati/core/functions/navigations.dart';
import 'package:taskati/core/services/local_storage.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/widgets/main_button.dart';
import 'package:taskati/features/home/page/home_screen.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  String? path;
  var nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              if (path != null && nameController.text.isNotEmpty) {
                LocalStorage.cacheData(LocalStorage.name, nameController.text);
                LocalStorage.cacheData(LocalStorage.image, path!);
                context.pushReplacementTo(const HomeScreen());
              } else if (path == null && nameController.text.isNotEmpty) {
                showMainDialog(context, 'Please select an image');
              } else if (path != null && nameController.text.isEmpty) {
                showMainDialog(context, 'Please enter your name');
              } else {
                showMainDialog(
                    context, 'Please select an image and enter your name');
              }
            },
            child: const Text('Done'),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  showUploadBottomSheet(context);
                },
                child: Stack(
                  children: [
                    path != null
                        ? ClipOval(
                            child: Image.file(
                              File(path ?? ''),
                              width: 140,
                              height: 140,
                              fit: BoxFit.cover,
                            ),
                          )
                        : const CircleAvatar(
                            radius: 70,
                            backgroundColor: AppColors.primaryColor,
                            backgroundImage: AssetImage(AppImages.user),
                          ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: CircleAvatar(
                        radius: 17,
                        backgroundColor:
                            Theme.of(context).scaffoldBackgroundColor,
                        child: const Icon(
                          Icons.camera_alt,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const Gap(20),
              const Divider(),
              const Gap(20),
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  hintText: 'Enter your name',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  showUploadBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  MainButton(
                    title: 'Upload From Camera',
                    onPressed: () {
                      uploadImage(true);
                    },
                  ),
                  const Gap(10),
                  MainButton(
                    title: 'Upload From Gallery',
                    onPressed: () {
                      uploadImage(false);
                    },
                  ),
                ],
              ));
        });
  }

  uploadImage(bool isCamera) async {
    var imagePicker = ImagePicker();
    var pickedImage = await imagePicker.pickImage(
        source: isCamera ? ImageSource.camera : ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        path = pickedImage.path;
      });
      Navigator.pop(context);
    }
  }
}
