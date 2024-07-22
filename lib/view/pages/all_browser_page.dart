import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:mirror_walll/provider/all_data_record.dart';
import 'package:provider/provider.dart';

class AllBrowserList extends StatefulWidget {
  const AllBrowserList({super.key});

  @override
  State<AllBrowserList> createState() => _AllBrowserListState();
}

class _AllBrowserListState extends State<AllBrowserList> {
  String browser = "https://www.google.co.in/.";
  String browserName = "";
  InAppWebViewController? inAppWebViewController;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actions: [
        Text("Cancel"),
        SizedBox(
          width: 12,
        ),
        Text("ok"),
      ],
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
                value: e['Url'],
                groupValue: browser,
                onChanged: (val) {
                  setState(
                    () {
                      browser = val ?? '';

                      inAppWebViewController?.loadUrl(
                          urlRequest: URLRequest(url: WebUri(val)));
                      // Navigator.pop(context);
                    },
                  );
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
