import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:musiquiz/src/pages/quizes/guess_by_lyrics/page.dart';
import 'package:musiquiz/src/pages/saved_tracks/page.dart';
import 'package:stack_trace/stack_trace.dart' as stack_trace;

import 'src/pages/main/page.dart';

void main() {
  FlutterError.demangleStackTrace = (StackTrace stack) {
    if (stack is stack_trace.Trace) return stack.vmTrace;
    if (stack is stack_trace.Chain) return stack.toTrace().vmTrace;
    return stack;
  };
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Musiquiz',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const MainPage(),
          'saved_tracks': (context) => const SavedTracksPage(),
          'lyrics_quiz': (context) => const GuessByLyricsQuizPage(),
        },
      ),
    );
  }
}
