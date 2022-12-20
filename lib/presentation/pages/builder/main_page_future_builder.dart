import 'package:flutter/material.dart';

import '../../../repositories/weather_repository.dart';

class MainPageFutureBuilder extends StatelessWidget {
  const MainPageFutureBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Future Builder'),
      ),
      body: Center(
        child: FutureBuilder(
          future: WeatherRepository().getCurrentWeather('Bandung'),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text(snapshot.error!.toString());
            } else if (snapshot.hasData) {
              return SizedBox(
                width: 100,
                height: 100,
                child: Image.asset(snapshot.data!.path),
              );
            } else {
              return const Text('Loading');
            }
          },
        ),
      ),
    );
  }
}


