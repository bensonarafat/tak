import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tak/core/constants/assets.dart';
import 'package:tak/core/constants/constants.dart';
import 'package:tak/core/data/models/user_model.dart';
import 'package:tak/core/services/get_it_services.dart';
import 'package:tak/core/services/secure_storage.dart';
import 'package:tak/core/widgets/tak_cache_network_image.dart';
import 'package:tak/features/profile/presentation/widgets/profile_gender.dart';
import 'package:tak/features/profile/presentation/widgets/profile_logout.dart';
import 'package:tak/features/profile/presentation/widgets/profile_name.dart';
import 'package:tak/features/profile/presentation/widgets/profile_phone.dart';
import 'package:tak/features/profile/presentation/widgets/profile_update_button.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController nameController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  SecureStorage secureStorage = getIt<SecureStorage>();
  String name = "";
  String? phone = "";
  String? gender = "";
  String avatar = imageplaceholder;
  File? userAvatar;

  @override
  void initState() {
    super.initState();
    _getUserData();
  }

  _getUserData() async {
    UserModel? usermodel = await secureStorage.getUserData();
    setState(() {
      name = "${usermodel?.name}";
      avatar = usermodel?.avatar ?? imageplaceholder;
      phone = usermodel?.phone;
      gender = "";
      nameController.text = name;
      genderController.text = gender ?? '';
      phoneController.text = phone ?? '';
    });
  }

  Future<XFile?> openImagePicker() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        userAvatar = File(image.path);
      });
    }
    return image;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: IconTheme(
            data: Theme.of(context).iconTheme,
            child: const Icon(
              Icons.keyboard_arrow_left,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Gap(32.h),
            Center(
              child: SizedBox(
                width: 143.w,
                height: 145.h,
                child: Stack(
                  children: [
                    Positioned(
                      left: 7.w,
                      top: 7.h,
                      child: userAvatar != null
                          ? Container(
                              width: 129.w,
                              height: 131.h,
                              decoration: ShapeDecoration(
                                shape: const OvalBorder(),
                                image: DecorationImage(
                                    image: FileImage(userAvatar!),
                                    fit: BoxFit.fill),
                              ),
                            )
                          : TakCachedNetworkImage(
                              path: avatar,
                              width: 129,
                              height: 131,
                              fit: BoxFit.fill,
                              shape: const OvalBorder(),
                            ),
                    ),
                    Builder(builder: (context) {
                      return Positioned(
                        left: 80.w,
                        top: 80.h,
                        child: GestureDetector(
                          onTap: () {
                            openImagePicker().then((value) {
                              if (value != null) {
                              } else {
                                setState(() {
                                  userAvatar = null;
                                });
                              }
                            });
                          },
                          child: SizedBox(
                            width: 60.w,
                            height: 60.h,
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 11.w,
                                  top: 12.37.h,
                                  child: SvgPicture.asset(
                                    cameraSVG,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ),
            Gap(16.h),
            Container(
              padding: EdgeInsets.all(16.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NameField(nameController: nameController),
                  Gap(16.h),
                  PhoneField(phoneController: phoneController),
                  Gap(16.h),
                  GenderField(genderController: genderController),
                  Gap(16.h),
                  UpdateProfileButton(
                    name: nameController.text,
                    gender: genderController.text,
                    phone: phoneController.text,
                  ),
                  Gap(143.h),
                  const ProfileLogout(),
                  Gap(37.h),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
