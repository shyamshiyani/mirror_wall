import 'package:flutter/material.dart';
import 'package:mirror_walll/provider/all_data_record.dart';
import 'package:provider/provider.dart';

class AllBrowserList extends StatefulWidget {
  const AllBrowserList({super.key});

  @override
  State<AllBrowserList> createState() => _AllBrowserListState();
}

class _AllBrowserListState extends State<AllBrowserList> {
  String browser = "google";
  String browserName = "Goggle";
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Browsers"),
      content: SizedBox(
        height: 195,
        width: 300,
        child: Column(
            children:
                Provider.of<AllBroswerData>(context).allBrowserUrl.map((e) {
          return Row(
            children: [
              Radio(
                value: e['value'],
                groupValue: browser,
                onChanged: (val) {
                  setState(
                    () {
                      browser = val ?? '';
                    },
                  );
                  // Provider.of<AllBroswerData>(context).allBrowserUrl['values']
                },
              ),
              Text("${e['value']}"),
            ],
          );
        }).toList()),
      ),
    );
  }
}
