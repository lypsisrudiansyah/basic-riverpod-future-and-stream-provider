import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_future_stream_provider_demo/presentation/pages/builder/main_page_stream_builder.dart';
import 'package:riverpod_future_stream_provider_demo/presentation/pages/provider/main_page_future_provider.dart';
import 'package:riverpod_future_stream_provider_demo/presentation/pages/provider/main_page_stream_provider.dart';

import 'presentation/pages/builder/main_page_future_builder.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Belajar Riverpod"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 50),
            child: const Text("Implementasi Future&Stream Provider Dengan Riverpod"),
          ),
          Center(
              child: Column(
            children: [
              ButtonReusable(
                textForButton: "Future Provider",
                redirect: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MainPageFutureProvider(),
                  ),
                ),
              ),
              ButtonReusable(
                textForButton: "Stream Provider",
                redirect: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MainPageStreamProvider(),
                  ),
                ),
              ),
              ButtonReusable(
                textForButton: "Future Builder",
                redirect: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MainPageFutureBuilder(),
                  ),
                ),
              ),
              ButtonReusable(
                  textForButton: "Stream Builder",
                  redirect: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MainPageStreamBuilder(),
                      ),
                    );
                  }),
            ],
          )),
        ],
      ),
    );
  }
}

class ButtonReusable extends StatelessWidget {
  String textForButton;
  VoidCallback redirect;
  ButtonReusable({
    required this.textForButton,
    required this.redirect,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.blueGrey,
      ),
      onPressed: redirect,
      child: Text(textForButton),
    );
  }
}
