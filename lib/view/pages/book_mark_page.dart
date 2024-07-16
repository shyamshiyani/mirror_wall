import 'package:flutter/material.dart';
import 'package:mirror_walll/provider/bookmark_provider.dart';
import 'package:provider/provider.dart';

class BookMarkUrl extends StatefulWidget {
  const BookMarkUrl({super.key});

  @override
  State<BookMarkUrl> createState() => _BookMarkUrlState();
}

class _BookMarkUrlState extends State<BookMarkUrl> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bookmark"),
      ),
      body: (Provider.of<BookMarkasUrls>(context).bookMarkesUrls.isEmpty)
          ? const Center(
              child: Text(
                "No BookMarks Found",
                style: TextStyle(fontSize: 22),
              ),
            )
          : Consumer<BookMarkasUrls>(
              builder: (context, bookMarkasUrl, _) {
                return Column(
                  children: bookMarkasUrl.bookMarkesUrls
                      .map(
                        (e) => InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed('webDetail', arguments: e);
                          },
                          child: Consumer<BookMarkasUrls>(
                            builder: (context, bookMarkasUrl, _) {
                              return Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    height: 50,
                                    child: Row(
                                      children: [
                                        const CircleAvatar(
                                          child: Icon(Icons.file_open_outlined),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "$e",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            bookMarkasUrl.removeUrl(e);

                                            print(
                                                "${Provider.of<BookMarkasUrls>(context, listen: false).bookMarkesUrls}");
                                          },
                                          icon: const Icon(Icons.delete),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      )
                      .toList(),
                );
              },
            ),
    );
  }
}
