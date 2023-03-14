import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'models/weathers.dart';
import 'network/network_request.dart';
import 'screens/home_page.dart';

final apiProvider = Provider<NetworkRequest>((ref) => NetworkRequest());

final weatherDataProvider = FutureProvider<Weathers>((ref) {
  return ref.read(apiProvider).fetchWeathers();
});

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RootPage(),
    );
  }
}

class RootPage extends ConsumerStatefulWidget {
  const RootPage({super.key});

  @override
  RootPageState createState() => RootPageState();
}

class RootPageState extends ConsumerState<RootPage> {
  // int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    // final weatherData = ref.watch(weatherDataProvider);
    return const Scaffold(
      body: HomePage(),
      // body: weatherData.when(data: (data) {
      //   return const HomePage();
      // }, error: ((error, stateTrace) {
      //   return const Text("Error");
      // }), loading: () {
      //   return const Center(
      //     child: CircularProgressIndicator(),
      //   );
      // }),
    );
  }
}
