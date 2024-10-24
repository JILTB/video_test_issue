import 'package:flutter/material.dart';
import 'package:video_test/fist_screen.dart';
import 'package:video_test/test.dart';

class SecondVideo extends StatefulWidget {
  const SecondVideo({super.key});

  @override
  State<SecondVideo> createState() => _SecondVideoState();
}

class _SecondVideoState extends State<SecondVideo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Video'),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              child: VideoLoopNetwork(path: 'lib/assets/test_video2.mp4'),
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FirstVideo(),
                ),
              ),
              child: const Text('first video'),
            ),
          ],
        ),
      ),
    );
  }
}
