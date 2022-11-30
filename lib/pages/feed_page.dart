import 'package:flutter/material.dart';

import '../model/network_images.dart';

/// Feed page to satisfy requirements:
///First-page “Feed”:
/// Have a list view builder with some asset and or network Images that we can scroll
/// You have to handle the scrollview
class FeedPage extends StatefulWidget {
  final NetworkImages networkImages;
  const FeedPage({Key? key, required this.networkImages}) : super(key: key);

  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  @override
  Widget build(BuildContext context) {
    List<Widget> images = [];
    for (String imageUrl in widget.networkImages.imagesList) {
      images.add(Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.network(
          imageUrl,
          height: 100.0,
        ),
      ));
    }
    return ListView(padding: const EdgeInsets.all(8), children: images);
  }
}
