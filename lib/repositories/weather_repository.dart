import 'dart:async';
import 'dart:math';

enum Weathers {
  sunny('assets/sunny.png'),
  rain('assets/rain.png'),
  cloudy('assets/cloudy.png');

  const Weathers(this.path);

  final String path;
}

class WeatherRepository {
  Future<Weathers> getCurrentWeather(String city) async {
    await Future.delayed(const Duration(seconds: 1));

    switch (Random().nextInt(4)) {
      case 0:
        return Weathers.cloudy;
      case 1:
        return Weathers.rain;
      case 2:
        return Weathers.sunny;
      default:
        throw Exception('Gagal Ambil Data');
        // return Weathers.sunny;

    }
  }

  Stream<Weathers> getWeatherStream(String city) async* {
    while (true) {
      yield await getCurrentWeather(city);
    }   
  }
}
