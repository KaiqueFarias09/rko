import 'package:flutter/material.dart';
import 'package:rko/presentation/views/home/home_view.dart';
import 'package:rko/presentation/views/secure-the-area/secure_the_area_view.dart';

class RouteGenerator {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SecureTheAreaView.id:
        return MaterialPageRoute(
          builder: (builder) => const SecureTheAreaView(),
        );

      case HomeView.id:
        return MaterialPageRoute(builder: (builder) => const HomeView());

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('Error while loading new page'),
        ),
      );
    });
  }
}
