import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:tak/core/utils/helpers.dart';

class DateDeparture extends StatefulWidget {
  final Function callback;
  final String value;
  const DateDeparture({
    super.key,
    required this.callback,
    this.value = '',
  });

  @override
  State<DateDeparture> createState() => _DateDepartureState();
}

class _DateDepartureState extends State<DateDeparture> {
  String? date;
  String? datespan;
  String? time;
  String? timespan;
  @override
  void initState() {
    DateTime now = DateTime.now();
    DateFormat formatter = DateFormat('d, MMM yyyy');
    DateFormat formatterspan = DateFormat('yyyy-MM-dd');
    date = formatter.format(now);
    datespan = formatterspan.format(now);
    time = DateFormat('h:mm a').format(now);
    DateFormat formattertime = DateFormat('hh:mm:ss');
    timespan = formattertime.format(now);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10.w, right: 10.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Departure",
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontSize: 16.sp,
                ),
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  getDate(context).then((DateTime? value) {
                    if (value != null) {
                      setState(() {
                        DateFormat formatter = DateFormat('d, MMM yyyy');
                        date = formatter.format(value);
                        DateFormat formatterspan = DateFormat('yyyy-MM-dd');
                        datespan = formatterspan.format(value);
                        if (date != null && time != null) {
                          widget.callback("$datespan $timespan");
                        }
                      });
                    }
                  });
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(4.0.w),
                    child: Text(
                      "$date",
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                fontSize: 14.sp,
                              ),
                    ),
                  ),
                ),
              ),
              Gap(4.w),
              GestureDetector(
                onTap: () {
                  getTime(context).then((TimeOfDay? value) {
                    if (value != null) {
                      setState(() {
                        time =
                            "${value.hour.toString().padLeft(2, '0')}:${value.minute.toString().padLeft(2, '0')} ${value.period.toString().split('.')[1]}";
                        if (date != null && time != null) {
                          timespan =
                              "${value.hour.toString().padLeft(2, '0')}:${value.minute.toString().padLeft(2, '0')}:00";

                          widget.callback("$datespan $timespan");
                        }
                      });
                    }
                  });
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(5.0.w),
                    child: Text(
                      "$time",
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                fontSize: 14.sp,
                              ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
