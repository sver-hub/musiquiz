import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:models/models.dart';
import 'package:musiquiz/src/di/service.dart';

class SearchPage extends HookConsumerWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final api = ref.watch(apiProvider);

    final textController = useTextEditingController();

    final searchResult = useState<SearchResponse?>(null);
    final searchType = useState<String?>(null);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Page'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: textController,
                ),
              ),
              DropdownButton(
                value: searchType.value,
                items: const [
                  DropdownMenuItem(
                    value: null,
                    child: Text('All'),
                  ),
                  DropdownMenuItem(
                    value: 'track',
                    child: Text('Tracks'),
                  ),
                  DropdownMenuItem(
                    value: 'artist',
                    child: Text('Artists'),
                  ),
                ],
                onChanged: (value) => searchType.value = value,
              ),
              const SizedBox(width: 20),
              ElevatedButton.icon(
                onPressed: () async {
                  final response = await api.search(
                    searchTerm: textController.text,
                    searchType: searchType.value,
                  );
                  searchResult.value = response;
                },
                icon: const Icon(Icons.search),
                label: const Text('Search'),
              ),
            ],
          ),
          Expanded(
            child: ListView(
              children: [
                for (final track in searchResult.value?.tracks ?? <Track>[])
                  _SearchResultItem.track(
                    title: track.name,
                    artistName: track.artists.first.name,
                    imgUrl: track.album.images.first.url,
                  ),
                for (final artist in searchResult.value?.artists ?? <Artist>[])
                  _SearchResultItem.artist(
                    title: artist.name,
                    imgUrl: artist.images.first.url,
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SearchResultItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imgUrl;

  const _SearchResultItem({
    required this.title,
    required this.subtitle,
    required this.imgUrl,
  });

  const _SearchResultItem.track({
    required this.title,
    required this.imgUrl,
    required String artistName,
  }) : subtitle = 'Track • $artistName';

  const _SearchResultItem.artist({
    required this.title,
    required this.imgUrl,
  }) : subtitle = 'Artist';

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      leading: CachedNetworkImage(
        imageUrl: imgUrl,
        height: 40,
        width: 40,
      ),
    );
  }
}
