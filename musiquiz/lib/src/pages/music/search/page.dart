import 'package:auto_route/annotations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:models/models.dart';

import '../../../di/service.dart';

@RoutePage()
class SearchPage extends HookConsumerWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final api = ref.watch(apiProvider);

    final textController = useTextEditingController();

    final searchResult = useState<SearchResponse?>(null);
    final searchType = useState<String?>(null);

    Future<void> onSearch() async {
      final response = await api.search(
        searchTerm: textController.text,
        searchType: searchType.value,
      );
      searchResult.value = response;
    }

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
                  onSubmitted: (_) => onSearch(),
                ),
              ),
              DropdownButton(
                value: searchType.value,
                items: const <DropdownMenuItem<String?>>[
                  DropdownMenuItem(
                    child: Text('All'),
                  ),
                  DropdownMenuItem(
                    value: 'track',
                    child: Text('Track'),
                  ),
                  DropdownMenuItem(
                    value: 'artist',
                    child: Text('Artist'),
                  ),
                  DropdownMenuItem(
                    value: 'album',
                    child: Text('Album'),
                  ),
                ],
                onChanged: (value) => searchType.value = value,
              ),
              const SizedBox(width: 20),
              ElevatedButton.icon(
                onPressed: onSearch,
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
                  ),
                for (final album in searchResult.value?.albums ?? <Album>[])
                  _SearchResultItem.album(
                    title: album.name,
                    imgUrl: album.images.first.url,
                    artistName: album.artists.first.name,
                  ),
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

  const _SearchResultItem.album({
    required this.title,
    required this.imgUrl,
    required String artistName,
  }) : subtitle = 'Album • $artistName';

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
