import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_future_stream_provider_demo/presentation/providers/weather_provider.dart';

class MainPageStreamProvider extends StatelessWidget {
  const MainPageStreamProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream Provider'),
      ),
      body: Center(
        child: Consumer(
          builder: (context, ref, child) => ref.watch(weatherStreamProvider).when(
                data: (data) => SizedBox(
                  width: 300,
                  height: 300,
                  child: Image.asset(data.path),
                ),
                error: (error, stackTrace) => Text("$error"),
                loading: () => const CircularProgressIndicator(),
              ),
        ),
      ),
    );
  }
}
