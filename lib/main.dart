import 'dart:math';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MuyuPage(),
    );
  }
}

class MuyuPage extends StatefulWidget {
  const MuyuPage({super.key});

  @override
  State<MuyuPage> createState() => _MuyuPageState();
}

class _MuyuPageState extends State<MuyuPage> {
  //维护一个计数器
  int _count = 0;
  final Random _random = Random();
  //音频池
  AudioPool? pool;

  @override
  void initState() {
    super.initState();
    _initAudioPool();
  }

  void _initAudioPool() async {
    pool = await FlameAudio.createPool('muyu_1.mp3', maxPlayers: 4); //加载音频
  }

  //add a curValue
  int _cruValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        titleTextStyle: const TextStyle(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text("电子木鱼"),
        actions: [
          IconButton(onPressed: _toHistory, icon: const Icon(Icons.history))
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: CountPanel(
                  count: _count,
                  onTapSwitchAudio: _onTapSwitchAudio,
                  onTapSwitchImage: _onTapSwitchImage)),
          Expanded(
              child: MuyuAssetsImage(image: 'images/muyu.png', onTap: _onKnock))
        ],
      ),
    );
  }

  void _onTapSwitchAudio() {
    // TODO: Add logic to switch audio
  }

  void _onTapSwitchImage() {
    // TODO: Add logic to switch image
  }

  void _toHistory() {
    // TODO: Add logic to navigate to history page
  }

  void _onKnock() {
    pool?.start(); //播放音频
    setState(() {
      _cruValue = 1 + _random.nextInt(3);
      _count += _cruValue;
    });
  }
}

class CountPanel extends StatelessWidget {
  final int count;
  final VoidCallback onTapSwitchAudio;
  final VoidCallback onTapSwitchImage;

  const CountPanel({
    super.key,
    required this.count,
    required this.onTapSwitchAudio,
    required this.onTapSwitchImage,
  });

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
      minimumSize: const Size(36, 36),
      padding: EdgeInsets.zero,
      backgroundColor: Colors.green,
      elevation: 0,
    );
    return Stack(
      children: [
        Center(
          child: Text(
            "功德数: $count",
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Positioned(
          right: 10,
          top: 10,
          child: Wrap(
            spacing: 8,
            direction: Axis.vertical,
            children: [
              ElevatedButton(
                onPressed: onTapSwitchAudio,
                style: style,
                child: const Icon(Icons.music_note_outlined),
              ),
              ElevatedButton(
                onPressed: onTapSwitchImage,
                style: style,
                child: const Icon(Icons.image),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class MuyuAssetsImage extends StatelessWidget {
  final String image;
  final VoidCallback onTap;

  const MuyuAssetsImage({super.key, required this.image, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: GestureDetector(
      onTap: onTap,
      child: Image.asset(image, height: 200),
    ));
  }
}
