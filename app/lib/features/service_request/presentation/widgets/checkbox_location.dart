import 'package:flutter/material.dart';

class CheckBoxLocation extends StatefulWidget {
  final Function callback;
  const CheckBoxLocation({
    super.key,
    required this.callback,
  });

  @override
  State<CheckBoxLocation> createState() => _CheckBoxLocationState();
}

class _CheckBoxLocationState extends State<CheckBoxLocation> {
  bool isSittingRoom = false;
  bool isBedroom = false;
  bool isKitchen = false;
  bool isOthers = false;
  List<String> location = [];

  void actionLocation() {
    widget.callback(location);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Location",
          style: Theme.of(context).textTheme.titleSmall,
        ),
        Row(
          children: [
            Row(
              children: [
                Checkbox(
                  value: isSittingRoom,
                  onChanged: (bool? value) {
                    setState(() {
                      isSittingRoom = value ?? false;
                      if (isSittingRoom) {
                        location.add('Sitting Room');
                      } else {
                        location.remove('Sitting Room');
                      }
                      actionLocation();
                    });
                  },
                ),
                Text(
                  'Sitting Room',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: isBedroom,
                  onChanged: (bool? value) {
                    setState(() {
                      isBedroom = value ?? false;
                      if (isBedroom) {
                        location.add('Bedroom');
                      } else {
                        location.remove('Bedroom');
                      }
                      actionLocation();
                    });
                  },
                ),
                Text(
                  'Bedroom',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: isKitchen,
                  onChanged: (bool? value) {
                    setState(() {
                      isKitchen = value ?? false;
                      if (isKitchen) {
                        location.add('Kitchen');
                      } else {
                        location.remove('Kitchen');
                      }
                      actionLocation();
                    });
                  },
                ),
                Text(
                  'Kitchen',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ],
            ),
          ],
        ),
        Row(
          children: [
            Checkbox(
              value: isOthers,
              onChanged: (bool? value) {
                setState(() {
                  isOthers = value ?? false;
                  if (isOthers) {
                    location.add('Others');
                  } else {
                    location.remove('Others');
                  }
                  actionLocation();
                });
              },
            ),
            Text(
              'Others',
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ],
        ),
      ],
    );
  }
}
