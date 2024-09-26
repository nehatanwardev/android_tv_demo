import 'package:android_demo/constant.dart';
import 'package:android_demo/video_player_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TV Demo App'),
      ),
      body: SingleChildScrollView(
        child: sampleVideoGrid(),
      ),
    );
  }

  Widget sampleVideoGrid() {
    return SingleChildScrollView(
      child: Column(
        children: [
          GridView(
            shrinkWrap: true,
            physics:
                const NeverScrollableScrollPhysics(), // Prevent scrolling of GridView
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            children: images.map((url) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => VideoPlayerScreen(
                        url: links[images.indexOf(
                            url)], // Assuming `links` and `images` are lists of equal length
                      ),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(
                    url,
                    height: 150,
                    width: 150,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
