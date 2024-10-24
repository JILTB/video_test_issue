import 'package:flutter/material.dart';
import 'package:video_test/second_screen.dart';
import 'package:video_test/test.dart';

class FirstVideo extends StatefulWidget {
  const FirstVideo({super.key});

  @override
  State<FirstVideo> createState() => _FirstVideoState();
}

class _FirstVideoState extends State<FirstVideo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('First Video'),
        ),
        body: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                child: VideoLoopNetwork(path: 'lib/assets/test_video1.mp4'),
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SecondVideo(),
                  ),
                ),
                child: const Text(' Second video'),
              ),
            ],
          ),
        ));
  }
}
