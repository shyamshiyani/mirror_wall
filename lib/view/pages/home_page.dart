import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:mirror_walll/provider/conectivity_cheak.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  InAppWebViewController? inAppWebViewController;
  PullToRefreshController? pullToRefreshController;
  @override
  void initState() {
    super.initState();

    Provider.of<ConectivityCheakProvider>(context, listen: false).IsConnect();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Browser"),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return const alertDailogBox();
                },
              );
            },
            icon: const Icon(
              Icons.more_vert,
            ),
          ),
        ],
      ),
      body: Consumer<ConectivityCheakProvider>(
        builder: (context, conectivityCheakProvider, _) {
          if (conectivityCheakProvider.isConnection) {
            return Column(
              children: [
                Expanded(
                  flex: 13,
                  child: InAppWebView(
                    initialUrlRequest: URLRequest(
                      url: WebUri("https://www.google.com/"),
                    ),
                    onLoadStop: (controller, url) async {
                      await pullToRefreshController!.endRefreshing();
                    },
                    onLoadStart: (controller, url) {
                      inAppWebViewController = controller;
                    },
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.home_outlined,
                          size: 30,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.bookmark_add_outlined,
                          size: 30,
                        ),
                      ),
                      IconButton(
                        onPressed: () async {
                          if (inAppWebViewController != null) {
                            if (await inAppWebViewController!.canGoBack()) {
                              inAppWebViewController?.goBack();
                            }
                          }
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          size: 30,
                        ),
                      ),
                      IconButton(
                        onPressed: () async {
                          if (inAppWebViewController != null) {
                            inAppWebViewController?.reload();
                          }
                        },
                        icon: const Icon(
                          Icons.refresh,
                          size: 30,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          if (inAppWebViewController != null) {
                            inAppWebViewController?.goForward();
                          }
                        },
                        icon: const Icon(
                          Icons.arrow_forward,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          } else {
            return const Center(
              child: Text("Cheak Internet Connection...."),
            );
          }
        },
      ),
    );
  }
}

class alertDailogBox extends StatefulWidget {
  const alertDailogBox({super.key});

  @override
  State<alertDailogBox> createState() => _alertDailogBoxState();
}

class _alertDailogBoxState extends State<alertDailogBox> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Browsers"),
      content: SizedBox(
        height: 195,
        width: 300,
        child: Column(
          children: [
            Row(
              children: [
                Radio(
                  value: false,
                  groupValue: "Google",
                  onChanged: (val) {},
                ),
                const Text("Google"),
              ],
            ),
            Row(
              children: [
                Radio(
                  value: false,
                  groupValue: "Yahoo",
                  onChanged: (val) {},
                ),
                const Text("Yahoo"),
              ],
            ),
            Row(
              children: [
                Radio(
                  value: false,
                  groupValue: "Being",
                  onChanged: (val) {},
                ),
                const Text("Being"),
              ],
            ),
            Row(
              children: [
                Radio(
                    value: false,
                    groupValue: "DuckDuckGo",
                    onChanged: (val) {}),
                const Text("DuckDuckGo"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
