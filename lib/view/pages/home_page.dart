import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:mirror_walll/provider/bookmark_provider.dart';
import 'package:mirror_walll/provider/conectivity_cheak.dart';
import 'package:mirror_walll/view/pages/all_browser_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  InAppWebViewController? inAppWebViewController;
  PullToRefreshController? pullToRefreshController;
  TextEditingController searchController = TextEditingController();

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
          PopupMenuButton(
            itemBuilder: (context) {
              return <PopupMenuEntry>[
                PopupMenuItem(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed("bookMarkUrl");
                    },
                    child: const Row(
                      children: [
                        Icon(Icons.bookmark),
                        SizedBox(
                          width: 12,
                        ),
                        Text("BookMarks"),
                      ],
                    ),
                  ),
                ),
                PopupMenuItem(
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return const AllBrowserList();
                          });
                    },
                    child: const Row(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.computer_rounded),
                          ],
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Text("Browsers"),
                      ],
                    ),
                  ),
                ),
              ];
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: const Icon(Icons.search),
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Search or type web address',
                      hintStyle: const TextStyle(color: Colors.grey),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 14, horizontal: 16),
                    ),
                    onSubmitted: (value) async {
                      String url = value;
                      if (!url.startsWith('http')) {
                        url = 'https://www.google.com/search?q=$url';
                      }
                      if (inAppWebViewController != null) {
                        await inAppWebViewController!.loadUrl(
                          urlRequest: URLRequest(
                            url: WebUri(url),
                          ),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 15,
            child: Consumer<ConectivityCheakProvider>(
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
                              onPressed: () async {
                                WebUri? webUri = await inAppWebViewController
                                    ?.getOriginalUrl();

                                if (webUri != null) {
                                  Provider.of<BookMarkasUrls>(
                                    context,
                                    listen: false,
                                  ).addUrl(webUri);
                                }
                              },
                              icon: const Icon(
                                Icons.bookmark_add_outlined,
                                size: 30,
                              ),
                            ),
                            IconButton(
                              onPressed: () async {
                                if (inAppWebViewController != null) {
                                  if (await inAppWebViewController!
                                      .canGoBack()) {
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
          ),
        ],
      ),
    );
  }
}
