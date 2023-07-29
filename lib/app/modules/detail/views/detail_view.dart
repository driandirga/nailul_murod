import 'package:flutter/material.dart';
// import 'package:just_audio/just_audio.dart';
import 'package:get/get.dart';

import '../controllers/detail_controller.dart';

class DetailView extends GetView<DetailController> {
  const DetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Get.parameters['title']!),
        //   actions: [
        //     IconButton(
        //       onPressed: () {
        //         playSampleSound();
        //       },
        //       icon: const Icon(Icons.play_arrow),
        //     )
        //   ],
        //   centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Text(
                    Get.parameters['detail']!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Artinya :',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    Get.parameters['translate'] ?? '1',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// void playSampleSound() async {
//   AudioPlayer player = AudioPlayer();
//   await player.setAsset('assets/audio/${Get.parameters['title']}.mp3');
//   player.play();
// }
