import 'package:flutter/material.dart';

class MaintenanceCheckBox extends StatefulWidget {
  final Function callback;
  const MaintenanceCheckBox({
    super.key,
    required this.callback,
  });

  @override
  State<MaintenanceCheckBox> createState() => _MaintenanceCheckBoxState();
}

class _MaintenanceCheckBoxState extends State<MaintenanceCheckBox> {
  bool isPlumbing = false;
  bool isElectrical = false;
  bool isFurniture = false;

  List<String> maintenance = [];

  void actionMaintenance() {
    widget.callback(maintenance);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Maintenance",
          style: Theme.of(context).textTheme.titleSmall,
        ),
        Row(
          children: [
            Row(
              children: [
                Checkbox(
                  value: isPlumbing,
                  onChanged: (bool? value) {
                    setState(() {
                      isPlumbing = value ?? false;
                      if (isPlumbing) {
                        maintenance.add('Plumbing');
                      } else {
                        maintenance.remove("Plumbing");
                      }
                      actionMaintenance();
                    });
                  },
                ),
                Text(
                  'Plumbing',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: isElectrical,
                  onChanged: (bool? value) {
                    setState(() {
                      isElectrical = value ?? false;
                      if (isElectrical) {
                        maintenance.add('Electrical');
                      } else {
                        maintenance.remove('Electrical');
                      }
                      actionMaintenance();
                    });
                  },
                ),
                Text(
                  'Electrical',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: isFurniture,
                  onChanged: (bool? value) {
                    setState(() {
                      isFurniture = value ?? false;
                      if (isFurniture) {
                        maintenance.add('Furniture');
                      } else {
                        maintenance.remove('Furniture');
                      }
                      actionMaintenance();
                    });
                  },
                ),
                Text(
                  'Furniture',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
