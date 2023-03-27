import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../routes/app_router.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      body: Center(
        child: SizedBox(
          width: 300,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                child: const Text('Guess by lyrics quiz'),
                onPressed: () =>
                    context.router.push(const GuessByLyricsQuizRoute()),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                child: const Text('Search'),
                onPressed: () => context.router.push(const SearchRoute()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
