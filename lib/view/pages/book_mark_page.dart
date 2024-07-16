import 'package:flutter/material.dart';

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
        title: Text("Bookmark"),
      ),
    );
  }
}
