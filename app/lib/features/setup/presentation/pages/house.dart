import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tak/core/utils/colors.dart';
import 'package:tak/core/utils/helpers.dart';
import 'package:tak/core/widgets/tak_along_loading.dart';
import 'package:tak/features/setup/domain/entities/account_select_entity.dart';
import 'package:tak/features/setup/domain/entities/house_entity.dart';

import 'package:tak/features/setup/presentation/bloc/setup_bloc.dart';

class HousesPage extends StatefulWidget {
  const HousesPage({super.key});

  @override
  State<HousesPage> createState() => _HousesPageState();
}

class _HousesPageState extends State<HousesPage> {
  int? picked;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SetUpBloc, SetupState>(
      buildWhen: (prev, current) {
        return current is SetupLoadingState ||
            current is FetchHousesLoadedState;
      },
      listener: (context, state) {
        if (state is SetupErrorState) {
          toast(state.message);
        }
        if (state is SetupLoadedState) {
          AccountSelectEntity selectEntity = state.accountSelectEntity;
          if (selectEntity.status) {
            context.go("/nav");
          }
        }
      },
      builder: (context, state) {
        if (state is SetupLoadingState) {
          return TakLoading(
            color:
                Theme.of(context).brightness == Brightness.dark ? white : dark,
          );
        } else if (state is FetchHousesLoadedState) {
          List<HousesEntity> housesEntity = state.housesEntity;
          return Column(
            children: [
              ListView.separated(
                itemBuilder: (context, index) {
                  return ListTile(
                    selected: picked == housesEntity[index].id,
                    onTap: () {
                      setState(() {
                        picked = housesEntity[index].id;
                      });
                    },
                    selectedColor: primaryColor,
                    title: Text(housesEntity[index].name),
                  );
                },
                separatorBuilder: (context, index) => const Divider(),
                itemCount: housesEntity.length,
                shrinkWrap: true,
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 33.h,
                  bottom: 33.h,
                ),
                width: 358.w,
                height: 52.h,
                child: TextButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        side: const BorderSide(
                          color: primaryColor,
                        ),
                      ),
                    ),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(primaryColor),
                  ),
                  child: state is SetupLoadingState
                      ? const TakLoading()
                      : Text(
                          "Submit",
                          style: GoogleFonts.robotoFlex(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: white,
                          ),
                        ),
                  onPressed: () {
                    context.read<SetUpBloc>().add(
                          AccountSelectHouseEvent(
                            houseId: picked.toString(),
                            status: "submitted",
                            role: "tenant",
                          ),
                        );
                  },
                ),
              )
            ],
          );
        } else {
          return const Text("There was an Error");
        }
      },
    );
  }
}
