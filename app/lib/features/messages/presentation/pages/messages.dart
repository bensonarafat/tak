import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:tak/core/constants/assets.dart';

class Messages extends StatefulWidget {
  const Messages({super.key});

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  List<dynamic> messages = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Messages',
        ),
      ),
      body: messages.isNotEmpty
          ? Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 250.w,
                    height: 250.h,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(messageGif),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Gap(16.h),
                  Text(
                    'No Messages Available',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  )
                ],
              ),
            )
          : SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(10.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Yesterday",
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                    Gap(8.h),
                    Card(
                      elevation: 0.2,
                      margin: EdgeInsets.all(0.w),
                      child: Container(
                        padding: EdgeInsets.all(8.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Payment Successfully!",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                            ),
                            Text(
                              "Lorem ipsum dolor sit amet consectetur. Ultrici es tincidunt eleifend vitae",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Gap(8.h),
                    Card(
                      elevation: 0.2,
                      margin: EdgeInsets.all(0.w),
                      child: Container(
                        padding: EdgeInsets.all(8.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Rent Due",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                            ),
                            Text(
                              "Lorem ipsum dolor sit amet consectetur. Ultrici es tincidunt eleifend vitae",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Gap(8.h),
                    Text(
                      "Jan, 27 2024",
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                    Gap(8.h),
                    Card(
                      elevation: 0.2,
                      margin: EdgeInsets.all(0.w),
                      child: Container(
                        padding: EdgeInsets.all(8.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Rent Payment reminder!",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                            ),
                            Text(
                              "Lorem ipsum dolor sit amet consectetur. Ultrici es tincidunt eleifend vitae",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Gap(8.h),
                    Card(
                      elevation: 0.2,
                      margin: EdgeInsets.all(0.w),
                      child: Container(
                        padding: EdgeInsets.all(8.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Service Request Updated",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                            ),
                            Text(
                              "Lorem ipsum dolor sit amet consectetur. Ultrici es tincidunt eleifend vitae",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Gap(8.h),
                    Card(
                      elevation: 0.2,
                      margin: EdgeInsets.all(0.w),
                      child: Container(
                        padding: EdgeInsets.all(8.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Visitor Checked-Out by Security",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                            ),
                            Text(
                              "Lorem ipsum dolor sit amet consectetur. Ultrici es tincidunt eleifend vitae",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Gap(8.h),
                    Card(
                      elevation: 0.2,
                      margin: EdgeInsets.all(0.w),
                      child: Container(
                        padding: EdgeInsets.all(8.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Visitor Checked-In by Security",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                            ),
                            Text(
                              "Lorem ipsum dolor sit amet consectetur. Ultrici es tincidunt eleifend vitae",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
