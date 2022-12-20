
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_future_stream_provider_demo/repositories/weather_repository.dart';

var weatherRepositoryProvider = Provider<WeatherRepository>(
  (ref) => WeatherRepository(),
);

var weatherFutureProvider = FutureProvider.autoDispose<Weathers>(
  (ref) => ref.watch(weatherRepositoryProvider).getCurrentWeather("Bandung"),
);

var weatherStreamProvider = StreamProvider.autoDispose<Weathers>(
  (ref) => ref.watch(weatherRepositoryProvider).getWeatherStream("Bandung"),
);