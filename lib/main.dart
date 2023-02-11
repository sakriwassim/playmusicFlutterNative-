import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  static const channel = MethodChannel("music/channel");
  playMusic() async {
    try {
      await channel.invokeMapMethod("play");
    } on PlatformException catch (e) {
      print(e.message);
    }
  }

  stopMusic() async {
    try {
      await channel.invokeMapMethod("stop");
    } on PlatformException catch (e) {
      print(e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                playMusic();
                print("hello world");
              },
              child: Text("play music"),
            ),
            ElevatedButton(
              onPressed: () {
                stopMusic();
                print("hello world");
              },
              child: Text("stop music"),
            ),
          ],
        ),
      ),
    );
  }
}
