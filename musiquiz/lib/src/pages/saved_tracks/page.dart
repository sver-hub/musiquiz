import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:models/models.dart';
import 'package:musiquiz/src/di/service.dart';

final savedTracksProvider =
    FutureProvider((ref) => ref.watch(apiProvider).getSavedTracks());

class SavedTracksPage extends ConsumerWidget {
  const SavedTracksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tracks = ref.watch(savedTracksProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Saved Tracks')),
      body: tracks.when(
        data: (data) => ListView.builder(
          itemBuilder: (context, index) => TrackWidget(data[index]),
          itemCount: data.length,
        ),
        error: (e, __) => Center(child: Text('$e')),
        loading: () => const Center(
          child: SizedBox.square(
            dimension: 50,
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}

class TrackWidget extends StatelessWidget {
  final Track track;
  const TrackWidget(this.track, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(track.name),
      subtitle: Text(track.artists.map((e) => e.name).join(', ')),
    );
  }
}
