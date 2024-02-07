import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tak/core/utils/colors.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:tak/core/utils/helpers.dart';
import 'package:tak/core/widgets/tak_along_loading.dart';
import 'package:tak/features/setup/domain/entities/account_select_entity.dart';
import 'package:tak/features/setup/presentation/bloc/setup_bloc.dart';

class SetupPage extends StatefulWidget {
  final PageController pageController;
  const SetupPage({super.key, required this.pageController});

  @override
  State<SetupPage> createState() => _SetupPageState();
}

class _SetupPageState extends State<SetupPage> {
  final List<String> items = [
    'Tenant',
    'Security',
  ];
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            margin: EdgeInsets.only(
              left: 16.h,
              right: 16.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: 8.h,
                      ),
                      child: Text(
                        "Almost there",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: 8.h,
                        bottom: 16.h,
                      ),
                      child: Text(
                        "Select your account role",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    DropdownButtonFormField2<String>(
                      isExpanded: true,
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 16),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      hint: Text(
                        'Select account type',
                        style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).hintColor,
                        ),
                      ),
                      items: items
                          .map((String item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ))
                          .toList(),
                      value: selectedValue,
                      onChanged: (String? value) {
                        setState(() {
                          selectedValue = value;
                        });
                      },
                      buttonStyleData: ButtonStyleData(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        width: 140.w,
                      ),
                      menuItemStyleData: MenuItemStyleData(
                        height: 40.h,
                      ),
                    ),
                    BlocConsumer<SetUpBloc, SetupState>(
                      listener: (context, state) {
                        if (state is SetupErrorState) {
                          toast(state.message);
                        }
                        if (state is SetupLoadedState) {
                          AccountSelectEntity selectEntity =
                              state.accountSelectEntity;
                          if (selectEntity.status) {
                            context.go("/security");
                          }
                        }
                      },
                      builder: (context, state) {
                        return Container(
                          margin: EdgeInsets.only(
                            top: 33.h,
                            bottom: 33.h,
                          ),
                          width: 358.w,
                          height: 52.h,
                          child: TextButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.r),
                                  side: const BorderSide(
                                    color: primaryColor,
                                  ),
                                ),
                              ),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  primaryColor),
                            ),
                            child: state is SetupLoadingState
                                ? const TakLoading()
                                : Text(
                                    "Continue",
                                    style: GoogleFonts.robotoFlex(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                      color: white,
                                    ),
                                  ),
                            onPressed: () {
                              if (selectedValue != null) {
                                if (selectedValue == "Security") {
                                  context.read<SetUpBloc>().add(
                                        AccountSelectSetupEvent(
                                          role: selectedValue!,
                                          status: "submitted",
                                        ),
                                      );
                                } else {
                                  widget.pageController.nextPage(
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeInOut,
                                  );
                                }
                              } else {
                                toast("You must select your role");
                              }
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
